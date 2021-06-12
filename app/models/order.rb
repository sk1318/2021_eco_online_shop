class Order < ApplicationRecord
    enum peyment_method: {クレジットカード:0, 銀行振込:1}
    enum status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3, 発送済み:4}
    belongs_to :customer
    has_many :order_details,dependent: :destroy
    
    def amount_all
       @order_details = OrderDetail.where(order_id: self.id)
       total = 0
       @order_details.each do  |order_detail|
       total += order_detail.amount
       end
       return total
    end
end
