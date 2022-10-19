class CreateItems < ActiveRecord::Migration[6.1]
  
  def change
    create_table :items do |t|
      
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :unit_price, null: false
      t.boolean :is_on_sale, null: false, default: true
      
      t.timestamps
    end
  end
end
