class Book < ApplicationRecord
  belongs_to :seller
  has_many :cart_elements
  has_many :carts, -> { not_canceled }, through: :cart_elements
  monetize :price_cents
  validates :title, :description, :author, :price, presence: true
end
