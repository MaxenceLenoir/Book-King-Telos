class Dashboard::BooksController < ApplicationController
  def index
    @earnings = current_seller.books_sold.sum(&:price)
  end
end
