class Order < ApplicationRecord
    enum peyment_method: {クレジットカード:1, 銀行振込:2}
end
