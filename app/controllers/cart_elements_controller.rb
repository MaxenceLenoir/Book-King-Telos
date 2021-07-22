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

  def destroy
    respond_to do |format|
      cart_element = CartElement.find(params[:id])
      authorize cart_element
      cart_element.destroy
      format.js { render 'carts/show.js.erb', cart: current_buyer.cart }
    end
  end
end
