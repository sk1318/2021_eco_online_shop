class Public::OrdersController < ApplicationController
    include CommonActions
    before_action :login_check
    before_action :carts_empty_check,except: [:done,:index,:show]
    
    def index
        @orders = current_customer.orders.all
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def done
    end
    
    def new
        @order = Order.new
    end
    
    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save
          current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
          @order_detail = OrderDetail.new #初期化宣言
          @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
          @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
          @order_detail.price = (cart_item.item.price)*1.1 #消費税込みに計算して代入
          @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
          @order_detail.save #注文商品を保存
          end #ループ終わり
      current_customer.cart_items.destroy_all #カートの中身を削除
      redirect_to done_path
    end
    
    def confirm
        @order = Order.new
        @cart_items = current_customer.cart_items
        @peyment_method = params[:order][:peyment_method]
        if  params[:order][:option] == "0"
           @address_all =  current_customer.address_all
           @zip_code = current_customer.zip_code
           @address = current_customer.address
           @name = "#{current_customer.last_name} #{current_customer.first_name}"
           
        elsif params[:order][:option] == "1"
            address = Address.find(params[:order][:option_address])
           @address_all = address.address_all
           @zip_code = address.zip_code
           @address = address.address
           @name = address.name
           
        elsif params[:order][:option] == "2"
            @address_all = "#{params[:order][:zip_code]} #{params[:order][:address]} #{params[:order][:name]}" 
            @zip_code = params[:order][:zip_code]
            @address = params[:order][:address]
            @name = params[:order][:name]
            
        end
    end
    
    
    private
    
    def order_params
        params.require(:order).permit(:peyment_method,:zip_code,:address,:name,:amount_biled,:delivery_charge)
    end
    
    
    def carts_empty_check
        if current_customer.cart_items.count == 0
            redirect_to cart_items_path
        end
    end
end
