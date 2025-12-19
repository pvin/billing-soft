class Customer < ApplicationRecord
	has_many :customer_products
  has_many :products, through: :customer_products
end
