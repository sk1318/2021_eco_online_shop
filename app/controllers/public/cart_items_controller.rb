class Public::CartItemsController < Public::ApplicationController

    before_action :amount_check,only: [:create]
    def create
        cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        
        if cart_item
            sum = cart_item.amount+ params[:cart_item][:amount].to_i
            if sum <= 10
            cart_item.update(amount: sum)
            redirect_to cart_items_path
            else
                flash[:error]= "同じ商品は10個までしか注文できません。"
                redirect_to cart_items_path
            end
        else
            cart_item = current_customer.cart_items.new(cart_item_params)
            cart_item.save
            redirect_to cart_items_path 
        end
        
        
    end
    
    def index
        @cart_items = current_customer.cart_items.all
    end
    
    def update
        cart_item = CartItem.find(params[:id])
        sum = params[:cart_item][:amount].to_i
        if sum <=10
            cart_item.update(cart_item_params)
            redirect_to cart_items_path
        else
            @cart_items = current_customer.cart_items.all
            flash[:error]= "同じ商品は10個までしか注文できません。"
            redirect_to cart_items_path
        end
       
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end
    
    def destroy_all
        cart_items = current_customer.cart_items
        cart_items.destroy_all
        redirect_to cart_items_path
    end
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:amount,:item_id)
    end
    
    def amount_check
        unless params[:cart_item][:amount].to_i >=1 
            flash[:error] = "個数を選択してください"
            redirect_to item_path(params[:cart_item][:item_id])
        end
    end
    
end
