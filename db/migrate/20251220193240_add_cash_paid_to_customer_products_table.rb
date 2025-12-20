class AddCashPaidToCustomerProductsTable < ActiveRecord::Migration[7.2]
  def change
    add_column :customer_products, :cash_paid, :decimal
  end
end
