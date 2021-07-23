require 'rails_helper'

RSpec.describe Buyer, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:account_money_cents) }
  it { should validate_numericality_of(:account_money_cents).is_greater_than_or_equal_to(0) }
end
