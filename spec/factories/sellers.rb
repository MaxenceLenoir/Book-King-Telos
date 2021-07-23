FactoryBot.define do
  factory :seller do
    sequence(:first_name) { |n| "first_name_seller_#{n}" }
    sequence(:last_name) { |n| "last_name_seller_#{n}" }
    sequence(:email) { |n| "seller#{n}@seller.com" }
    sequence(:phone) { Faker::PhoneNumber.cell_phone_in_e164 }
    password { 'qwerty' }
  end
end
