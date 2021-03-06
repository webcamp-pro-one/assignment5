class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :price_intax
      t.integer :amount
      t.integer :is_active, null: false, default: 0
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :item_id
      t.integer :order_id

      t.timestamps
    end
  end
end
