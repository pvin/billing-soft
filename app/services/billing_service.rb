class BillingService
  def self.bill(products, customer, cash_received)
    ActiveRecord::Base.transaction do
      bill_no = next_bill_no
      total = 0
      products.values.each do |prod|
        product   = fetch_product(prod[:product_id])
        quantity  = prod[:quantity].to_i
        line_total = line_total(product, quantity)
        total += line_total
        CustomerProduct.create!(customer_id: customer.id, product_id: product.id, quantity: quantity, bill_no: bill_no, line_total: line_total, cash_paid: cash_received.to_d)
      end
      CustomerProduct.where(bill_no: bill_no).update_all(bill_total: total, updated_at: Time.current)
      bill_no
    end
  end

  private

  def self.next_bill_no
    CustomerProduct.maximum(:bill_no).to_i + 1
  end

  def self.fetch_product(product_code)
    Product.find_by!(product_id: product_code)
  end

  def self.line_total(product, quantity)
    base = product.price * quantity
    tax  = base * product.tax_percentage / 100.0
    base + tax
  end
end
