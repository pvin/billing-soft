class AddLineTotalAndQuantityToCustomerProductsTable < ActiveRecord::Migration[7.2]
  def change
    add_column :customer_products, :line_total, :decimal
    add_column :customer_products, :quantity, :integer
  end
end
