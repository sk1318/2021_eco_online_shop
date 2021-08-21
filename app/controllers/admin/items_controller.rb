class Admin::ItemsController < Admin::ApplicationController
    before_action :set_item,only: [:show,:edit,:update,:destroy]
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        @item.image.attach(params[:item][:image])
        if @item.save
        redirect_to admin_item_path(@item)
        else
        render :new
        end
    end
    def index
        if params[:search]
        @items = Item.where('name LIKE ?', "%#{params[:search]}%") 
        else
        @items = Item.all
        end
        
    end
    
    
    def show
        
    end
    
    def destroy
        @item.destroy
        flash[:success]="削除しました"
        redirect_to admin_items_path
    end
    
    def edit
        
    end
    
    def update
        if @item.update(item_params)
        redirect_to admin_items_path
        else
        render :edit
        end
    end
    private
    
    def item_params
        params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
    end
    
    def set_item
        @item = Item.find(params[:id])
    end
end
