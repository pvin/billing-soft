class AddUniqueIndexToProductsProductId < ActiveRecord::Migration[7.2]
  def change
    add_index :products, :product_id, unique: true, where: "product_id IS NOT NULL"
  end
end
