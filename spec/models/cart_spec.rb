require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should belong_to(:buyer) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:amount_cents) }
  it { should validate_inclusion_of(:state).in_array(Cart::STATES) }
  it { should validate_numericality_of(:amount_cents).is_greater_than_or_equal_to(0) }
end
