class Order < ApplicationRecord
  belongs_to :customer
  has_many :product, through: :order_detail
  has_many :product
  validates :total_due, presence: true
  validates :order_date, presence: true
  validates :total_due, numericality: true
end
