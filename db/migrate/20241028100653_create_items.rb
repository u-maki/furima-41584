class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
          t.integer :category_id, null: false
          t.integer :condition_id, null: false
          t.integer :shipping_cost_id
          t.integer :prefecture_id, null: false
          t.integer :shipping_time_id, null: false
          t.string :product_name, null: false
          t.text :product_description, null: false
          t.integer :price, null: false
          t.references :user, null: false, foreign_key: true
          t.string :image
    
          t.timestamps
    end
  end
end
