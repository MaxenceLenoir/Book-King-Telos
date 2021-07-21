class Cart < ApplicationRecord
  STATES = %w[pending paid canceled]

  belongs_to :buyer
  has_many :cart_elements
  validates :state, presence: true, inclusion: { in: Cart::STATES }

  default_scope { pending }

  scope :pending, -> { where(state: 'pending') }
  scope :no_scope, -> { unscope(where: :state) }
  scope :not_canceled, -> { no_scope.where(state: %w[pending paid]) }
  scope :paid, -> { no_scope.where(state: 'paid') }
end
