require 'rails_helper'

RSpec.describe CartElement, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:book) }
end
