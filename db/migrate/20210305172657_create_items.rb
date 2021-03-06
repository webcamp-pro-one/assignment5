class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.integer :is_active, null: false, default: 0
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :genre_id

      t.timestamps
    end
  end
end
