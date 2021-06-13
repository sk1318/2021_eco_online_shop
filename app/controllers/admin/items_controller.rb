class Admin::ItemsController < ApplicationController
    include CommonActions
    before_action :admin_check
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path(@item)
    end
    def index
        if params[:search]
        @items = Item.where('name LIKE ?', "%#{params[:search]}%") 
        else
        @items = Item.all
        end
        
    end
    
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to admin_items_path
    end
    private
    
    def item_params
        params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
    end
end
