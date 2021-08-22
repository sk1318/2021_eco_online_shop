class Public::CardController < ApplicationController
  require "payjp"

  def new
      card = Card.where(customer_id: current_customer.id)
      redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      user = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_customer.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {customer_id: current_customer.id}
      ) #念の為metadataにcustomer_idを入れましたがなくてもOK
      @card = Card.new(customer_id: current_customer.id, user_id: user.id, card_id: user.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(customer_id: current_customer.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.user_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(customer_id: current_customer.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.user_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
