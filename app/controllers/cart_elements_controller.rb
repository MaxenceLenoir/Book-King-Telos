class CartElementsController < ApplicationController
  def index
    
  end

  def create
    respond_to do |format|
      @book = Book.find(params[:book_id])
      cart_element = CartElement.new(book: @book, cart: current_buyer.cart)
      authorize cart_element
      cart_element.save
      BooksChannel.broadcast_to('books', id: @book.id)
      format.js { render 'books/show.js.erb' }
    end
  end
end
