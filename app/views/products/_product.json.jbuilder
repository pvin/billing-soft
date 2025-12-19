json.extract! product, :id, :name, :product_id, :price, :tax_percentage, :available_stock, :created_at, :updated_at
json.url product_url(product, format: :json)
