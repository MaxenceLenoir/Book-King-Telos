FactoryBot.define do
  factory :cart do
    state { 'pending' }
    amount_cents { 0 }
    buyer
  end
end
