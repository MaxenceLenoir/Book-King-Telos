class Cart < ApplicationRecord
  STATES = %w[pending paid canceled]

  belongs_to :buyer
  has_many :cart_elements
  validates :state, presence: true, inclusion: { in: Cart::STATES }

  scope :pending, -> { where(state: 'pending') }
  scope :not_canceled, -> { where(state: %w[pending paid]) }
  scope :paid, -> { where(state: 'paid') }
end
