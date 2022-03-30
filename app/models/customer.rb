class Customer < ApplicationRecord
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel_number, presence: true
  validates :card_number, presence: true
  validates :address, presence: true
end
