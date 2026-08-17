class AddNotNullConstraintsToCustomerProducts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :customer_products, :quantity, false
    change_column_null :customer_products, :line_total, false
    change_column_null :customer_products, :cash_paid, false
    change_column_null :customer_products, :bill_no, false
  end
end
