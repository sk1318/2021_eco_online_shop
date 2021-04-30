class Public::CartItemsController < ApplicationController
    def create
        cart_items = CartItem.all
        is_exist = false
        id = 0
        current_customer.cart_items.each do |cart_item|
            if cart_item.item_id == params[:cart_item][:item_id].to_i
                is_exist = true
                id = cart_item.id
            end
        end
        
        if is_exist
            cart_item = CartItem.find(id)
            sum = cart_item.amount.to_i + params[:cart_item][:amount].to_i
            if sum <=10
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
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:amount,:item_id)
    end
    
end
