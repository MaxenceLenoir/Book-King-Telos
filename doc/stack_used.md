# Developing

## Stack

- [Ruby on Rails](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Bootstrap](https://getbootstrap.com/)

## Gems

### Development

- gem 'devise' : Authentication for two kind of users (Buyer / Seller)
- gem 'money-rails'
- gem "pundit" : Authorization handler
- gem 'pg_search' : Create easy scope for the search method
- gem 'faker' : Populate the seed
- gem "letter_opener" : Preview email in the browser 

### Testing

- gem 'factory_bot_rails' : Create factories for testing
- gem 'rspec-rails', '~> 5.0.0'
- gem 'shoulda-matchers', '~> 5.0' : Facilitate Model Testing
- gem 'database_cleaner-active_record' : Clean database while testing

## Others

#### 1. Action Cable

Create a channel in order to know when a book is booked in real time.

Eg : If a user is on the index book page, and another one add a book to his cart at the same time, the book will disappear from the index book page.
On a book show page, the button "Add to cart" is remplaced by the message : "We are sorry but this book is no longer available".

#### 2. Rendering js

In some controller, I'm rendering javascript in order not the page to reload.

Eg : When a user add a book to his cart, the button "Add to cart" is remplaced by the message : "We are sorry but this book is no longer available" and the notification number on the navbar is incermented by 1

