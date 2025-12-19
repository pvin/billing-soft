class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_id
      t.decimal :price
      t.decimal :tax_percentage
      t.integer :available_stock

      t.timestamps
    end
  end
end
