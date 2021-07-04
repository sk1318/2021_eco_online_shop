class Address < ApplicationRecord
    belongs_to :customer
    validates :zip_code,presence: true
    validates :address,presence: true
    validates :name,presence: true
    
    def address_all
        "〒#{self.zip_code} #{self.address}  #{ self.name}"
    end
end
