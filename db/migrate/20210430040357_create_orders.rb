class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_charge
      t.integer :peyment_method
      t.integer :amount_biled
      t.string :zip_code
      t.string :address
      t.string :name
      t.integer :status,default: 0

      t.timestamps
    end
  end
end
