class Public::OrdersController < Public::ApplicationController
    include CommonActions
    before_action :carts_empty_check,except: [:done,:index,:show]
    before_action :payjp_check,only: [:create]

    def index
        @orders = current_customer.orders.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def done
        @order = current_customer.orders.last

    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if params[:order][:peyment_method]== "クレジットカード"
        @order.status = 1
        end
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
        OrdersMailer.send_mail(@order).deliver_now
        AdminMailer.send_mail(@order).deliver_now
        redirect_to done_path
    end

    def confirm
        @order = Order.new
        @cart_items = current_customer.cart_items
        @peyment_method = params[:order][:peyment_method]
        @shipping_cost = 800

        if  params[:order][:option] == "0"
           @address_all =  current_customer.address_all
           @zip_code = current_customer.zip_code
           @address = current_customer.address
           @name = "#{current_customer.last_name} #{current_customer.first_name}"

        elsif params[:order][:option] == "1"
           address = Address.find_by(id: params[:order][:option_address])
           if address
           @address_all = address.address_all
           @zip_code = address.zip_code
           @address = address.address
           @name = address.name
           else
              render :new
           end

        elsif   params[:order][:option] == "2"
           @address_all = "中央大学（白門祭実行委員会で管理）"
           @zip_code = "192-0393"
           @address = "東京都八王子市東中野 742-1"
           @name = "白門祭実行委員会"
           @shipping_cost = 0

        elsif params[:order][:option] == "3"
            if params[:order][:zip_code].empty? || params[:order][:address].empty? || params[:order][:name].empty?
                render :new
            else
            @address_all = "#{params[:order][:zip_code]} #{params[:order][:address]} #{params[:order][:name]}"
            @zip_code = params[:order][:zip_code]
            @address = params[:order][:address]
            @name = params[:order][:name]
            end
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

    def payjp_check
        if params[:order][:peyment_method]== "クレジットカード"
            Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
            if params[:order][:amount_biled].present? && params['payjp-token'].present?
                Payjp::Charge.create(
                :amount => params[:order][:amount_biled],
                :card => params['payjp-token'],
                :currency => 'jpy'
                )
            else
                flash[:error]= "注文できませんでした。クレジットカード情報を登録して下さい。"
                redirect_to orders_confirm_path
            end
        end
    end
end
