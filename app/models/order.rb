class Order < ApplicationRecord
  belongs_to :customer
  has_many :product, through: :order_details
  has_many :order_details
  validates :total_due, presence: true
  validates :order_date, presence: true
  validates :total_due, numericality: true
  accepts_nested_attributes_for :order_details
end
