class Cart < ApplicationRecord
  STATES = %w[pending paid canceled]

  belongs_to :buyer
  has_many :cart_elements, dependent: :destroy
  has_many :books, through: :cart_elements
  validates :state, presence: true, inclusion: { in: Cart::STATES }

  monetize :amount_cents
  validates :amount_cents, numericality: { greater_than_or_equal_to: 0 }

  scope :pending, -> { where(state: 'pending') }
  scope :not_canceled, -> { where(state: %w[pending paid]) }
  scope :paid, -> { where(state: 'paid') }
end
