class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :zip_code
  validates :address
  validates :telephone_number
  end

 with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: "をカナで入力してください。" }do
  validates :last_name_kana
  validates :first_name_kana
 end
 with_options numericality: {only_integer: true} do
   validates :zip_code
   validates :telephone_number
 end

  has_many :cart_items,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_many :orders

  def address_all
        "〒#{self.zip_code} #{self.address}  #{ self.last_name} #{self.first_name}"
  end

  def all_name
    "#{self.last_name} #{self.first_name}"
  end

  def all_kana
    "#{self.last_name_kana} #{self.first_name_kana}"
  end
end
