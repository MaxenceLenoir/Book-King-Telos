FactoryBot.define do
  factory :buyer do
    sequence(:first_name) { |n| "first_name_buyer_#{n}" }
    sequence(:last_name) { |n| "last_name_buyer_#{n}" }
    sequence(:email) { |n| "buyer#{n}@buyer.com" }
    sequence(:address) { Faker::Address.full_address }
    sequence(:account_money_cents) { 5_000 }
    password { 'qwerty' }

    after(:create) { |relationship| create(:cart, buyer_id: relationship.id) }
  end
end
