class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    
    def subtotal
        (self.item.price*1.1).floor*(self.amount)
    end
     
end
