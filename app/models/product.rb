class Product < ApplicationRecord
  belongs_to :category
  has_many :order, through: :order_detail
  has_one_attached :image, dependent: :destroy
end
