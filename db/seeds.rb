products = [
  { name: "Pantene Shampoo",      product_id: "pan150", price: 85.0,  tax_percentage: 5.0, available_stock: 100 },
  { name: "Aqua Water Bottle",    product_id: "aqu11",   price: 20.0,  tax_percentage: 5.0, available_stock: 200 },
  { name: "Gold Winner Oil",      product_id: "goldw1", price: 120.0, tax_percentage: 5.0, available_stock: 150 },
  { name: "Vim Dishwash Bar",     product_id: "vim100", price: 10.0,  tax_percentage: 5.0, available_stock: 300 },
  { name: "Lux Soap",             product_id: "lux150", price: 15.0,  tax_percentage: 5.0, available_stock: 250 },
  { name: "Colgate Toothpaste",   product_id: "col100", price: 55.0,  tax_percentage: 5.0, available_stock: 180 },
  { name: "Surf Excel Powder",    product_id: "sur500", price: 95.0,  tax_percentage: 5.0, available_stock: 120 },
  { name: "Dettol Handwash",      product_id: "det200", price: 60.0,  tax_percentage: 5.0, available_stock: 160 },
  { name: "Clinic Plus Shampoo",  product_id: "cli180", price: 90.0,  tax_percentage: 5.0, available_stock: 140 },
  { name: "Tata Salt",             product_id: "salt1", price: 25.0,  tax_percentage: 0.0, available_stock: 400 }
]

products.each do |attrs|
  Product.find_or_create_by!(product_id: attrs[:product_id]) do |product|
    product.assign_attributes(attrs)
  end
end

puts "Seeded #{products.size} products"