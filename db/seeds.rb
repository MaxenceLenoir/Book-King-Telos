puts "Destroying data"

Cart.destroy_all
Buyer.destroy_all
Book.destroy_all
Seller.destroy_all

puts "Creating sellers..."

5.times do |n|
  Seller.create!(first_name: "seller#{n}", last_name: "seller#{n}", email: "seller#{n}@seller.com", phone: Faker::PhoneNumber.cell_phone_in_e164, password: "qwerty")
  puts "#{n + 1} sellers created"
end

puts "Creating buyers..."

5.times do |n|
  Buyer.create!(first_name: "buyer#{n}", last_name: "buyer#{n}", email: "buyer#{n}@buyer.com", address: Faker::Address.full_address, password: "qwerty")
  puts "#{n + 1} buyers created"
end

puts "Creating books..."

20.times do |n|
  Book.create!(title: Faker::Book.title, description: "This the description from the book #{n}. It's a really good book, you probably should read it", author: Faker::Book.author, seller: Seller.all.sample, price: (5..50).to_a.sample)
  puts "#{n + 1} books created"
end

puts "Creating cart..."

Cart.create!(buyer: Buyer.all.sample)

puts "1 cart created"

books_available = Book.all.to_a

puts "Creating cart_elements..."

5.times do |n|
  book_cart_element = books_available.sample
  CartElement.create!(book: book_cart_element, cart: Cart.first)
  puts "#{n + 1} cart_elements created"
  books_available = books_available.reject { |book| book == book_cart_element }
end