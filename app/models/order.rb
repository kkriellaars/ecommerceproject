class Order < ApplicationRecord
  belongs_to :customer
  has_many :product, through: :order_detail
end
