class CustomerProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :bill_no, :line_total, :cash_paid, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
