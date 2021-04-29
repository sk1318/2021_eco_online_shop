class Public::CartItemsController < ApplicationController
    def create
        cart_items = CartItem.all
        is_exist = false
        id = 0
        cart_item = cart_items.find_by(item_id: params[:item_id])
        
        if cart_item
            is_exist = true
            id = params[:item_id]
        end
        
        if is_exist
            cart_item = CartItem.find(id)
            sum = cart_item.amount.to_i + params[:amount].to_i
            cart_item.update(amount: sum)
            redirect_to cart_items_path
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
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:amount,:item_id)
    end
    
end
