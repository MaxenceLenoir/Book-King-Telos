class Book < ApplicationRecord
  include PgSearch::Model

  belongs_to :seller
  has_many :cart_elements
  has_many :carts, -> { not_canceled }, through: :cart_elements
  monetize :price_cents
  validates :title, :description, :author, :price, presence: true

  pg_search_scope :search_by_title, against: :title
end
