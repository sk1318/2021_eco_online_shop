class Public::HomesController < Public::ApplicationController
    def top
        @items = Item.order(id: :ASC).limit(4)
    end
    
    def about
    end
end
