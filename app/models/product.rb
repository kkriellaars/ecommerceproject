class Product < ApplicationRecord
  def initialize(params = {})
    @params = params
  end

  belongs_to :category
  has_many :order, through: :order_details
  has_many :order
  has_one_attached :image, dependent: :destroy
  validates :name, presence: true
  validates :unit_price, presence: true
  validates :unit_price, numericality: true
  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :on_sale, presence: true
  validates :description, presence: true

  def self.search(search, search_category)
    @products = if search && search_category == ""
                  Product.where("name LIKE :search OR description LIKE :search",
                                search: "%#{search}%")
                elsif search != "" && search_category != ""
                  @category_products = Product.where("category_id = :search_category",
                                                     search:          "%#{search}%",
                                                     search_category: search_category.to_s)
                  @products = @category_products.where(
                    "name LIKE :search OR description LIKE :search",
                    search: "%#{search}%"
                  )
                elsif search == "" && search_category
                  Product.where("category_id = :search_category",
                                search_category: search_category.to_s)
                else
                  Product.all
                end
  end
end
