FactoryBot.define do
  factory :book do
    seller
    sequence(:title) { |n| "book_name_#{n}" }
    sequence(:description) { |n| "book_description_#{n}" }
    sequence(:author) { |n| "book_author_#{n}" }
    price_cents { (500..5000).to_a.sample }
  end
end
