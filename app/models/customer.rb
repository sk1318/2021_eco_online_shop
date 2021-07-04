class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name,presence: true
  validates :first_name,presence: true
  validates :last_name_kana,presence: true
  validates :first_name_kana,presence: true
  validates :zip_code,presence: true
  validates :address,presence: true
  validates :telephone_number,presence: true
  
  has_many :cart_items,dependent: :destroy
  def is_deleted?
    super && (self.is_deleted == true)
  end
end
