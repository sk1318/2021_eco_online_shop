class Public::HomesController < Public::ApplicationController
    def top
        @items = Item.order(created_at: :desc).limit(4)
    end
    
    def about
    end
end
