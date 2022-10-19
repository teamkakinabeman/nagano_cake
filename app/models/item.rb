class Item < ApplicationRecord
  
  def change
    create_table :items do |t|
      
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :unit_price, null: false
      t.boolean :is_on_sale, default: true, null: false
      
      t.timestamps
    end
  end
  
end
