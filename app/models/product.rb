class Product < ApplicationRecord
  belongs_to :category
  has_many :order, through: :order_details
  has_many :order
  has_one_attached :image, dependent: :destroy
  validates :name, presence: true
  validates :unit_price, presence: true
  validates :quantity, presence: true
  validates :on_sale, presence: true
  validates :description, presence: true
end
