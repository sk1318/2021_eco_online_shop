class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :customer_id
      t.string :user_id
      t.string :card_id

      t.timestamps
    end
  end
end
