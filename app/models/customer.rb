class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders

  validates :email, presence: true
  validates :card_number, numericality: { only_integer: true }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
