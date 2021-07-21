class Book < ApplicationRecord
  belongs_to :seller
  monetize :price_cents
  validates :title, :description, :author, :price, presence: true
end
