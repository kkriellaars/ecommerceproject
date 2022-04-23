class Province < ApplicationRecord
  has_many :customers, dependent: :nullify

  validates :name, presence: true
end
