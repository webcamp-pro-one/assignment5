class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :shipping
      t.integer :billing_amount
      t.integer :payment_option, null: false, default: 0
      t.integer :is_active, null: false, default: 0
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :customer_id

      t.timestamps
    end
  end
end
