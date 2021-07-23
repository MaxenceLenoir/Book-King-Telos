class Cart < ApplicationRecord
  STATES = %w[pending paid canceled]

  monetize :amount_cents
  validates :state, presence: true, inclusion: { in: Cart::STATES }
  validates :amount_cents, presence: true
  validates :amount_cents, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :buyer
  has_many :cart_elements, dependent: :destroy
  has_many :books, through: :cart_elements

  scope :pending, -> { where(state: 'pending') }
  scope :not_canceled, -> { where(state: %w[pending paid]) }
  scope :paid, -> { where(state: 'paid') }
end
