class Item < ApplicationRecord
    belongs_to :genre
     has_one_attached :image
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    
    with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    end
    validates :price,numericality: {only_integer: true}
end
