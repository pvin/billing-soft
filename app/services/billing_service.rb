class BillingService
  class << self
    def bill(products, customer, cash_received)
      ActiveRecord::Base.transaction do
        bill_no   = next_bill_no
        cash_paid = cash_received.to_d

        # Filter valid line items and batch-fetch products in one query
        valid_items = products.values.select { |p| p[:product_id].present? && p[:quantity].to_i.positive? }
        raise ArgumentError, "At least one product with a valid quantity is required" if valid_items.empty?

        product_ids = valid_items.map { |p| p[:product_id] }
        products_by_code = Product.where(product_id: product_ids).index_by(&:product_id)

        # Verify all submitted product_ids exist in the database
        missing = product_ids.select { |pid| products_by_code[pid.to_s].nil? }
        if missing.any?
          raise ActiveRecord::RecordNotFound, "Product(s) not found: #{missing.join(', ')}"
        end

        # Build line items and compute total in one pass
        now = Time.current
        records = valid_items.map do |prod|
          product  = products_by_code.fetch(prod[:product_id].to_s)
          quantity = prod[:quantity].to_i
          lt       = line_total(product, quantity)

          CustomerProduct.new(
            customer_id: customer.id, product_id: product.id, quantity: quantity,
            bill_no: bill_no, line_total: lt, cash_paid: cash_paid,
            created_at: now, updated_at: now
          )
        end

        total = records.sum(&:line_total)

        # Save all records with bill_total set — preserves model validations
        records.each do |record|
          record.bill_total = total
          record.save!
        end

        bill_no
      end
    end

    private

    def next_bill_no
      CustomerProduct.maximum(:bill_no).to_i + 1
    end

    def line_total(product, quantity)
      base = product.price * quantity
      tax  = base * product.tax_percentage / 100.0
      base + tax
    end
  end
end
