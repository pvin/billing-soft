class Product < ApplicationRecord
	validates :product_id, uniqueness: true
	has_many :customer_products
  has_many :customers, through: :customer_products
end
