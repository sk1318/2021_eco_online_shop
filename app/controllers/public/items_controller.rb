class Public::ItemsController < ApplicationController
    include CommonActions
    before_action :login_check,only: [:show]
    
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end
end
