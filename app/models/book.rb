class Book < ApplicationRecord
  include PgSearch::Model

  monetize :price_cents
  
  validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :title, :description, :author, :price, presence: true
  
  belongs_to :seller
  has_many :cart_elements
  has_many :carts, through: :cart_elements

  pg_search_scope :search_by_title, against: :title

  # A book is available if is is no linked to a paid / pending card
  def available?
    carts.select { |cart| cart.state == "paid" || cart.state == "pending" }.empty?
  end

  def sold?
    carts.select { |cart| cart.state == "paid" }.any?
  end
end
