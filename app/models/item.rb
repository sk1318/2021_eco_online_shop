class Item < ApplicationRecord
    belongs_to :genre
    attachment :image
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    
    with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    end
end
