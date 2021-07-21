class Book < ApplicationRecord
  belongs_to :seller
  validates :title, :description, :author, :price_cents, presence: true
end
