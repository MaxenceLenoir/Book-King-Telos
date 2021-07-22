class CartElementsController < ApplicationController
  def create
    respond_to do |format|
      @book = Book.find(params[:book_id])
      cart_element = CartElement.new(book: @book, cart: current_buyer.cart)
      authorize cart_element
      cart_element.save
      current_buyer.cart.increment(:amount_cents, @book.price_cents).save
      BooksChannel.broadcast_to('books', id: @book.id)
      format.js { render 'books/show.js.erb' }
    end
  end

  def destroy
    respond_to do |format|
      cart_element = CartElement.find(params[:id])
      authorize cart_element
      current_buyer.cart.decrement(:amount_cents, cart_element.book.price_cents).save
      cart_element.destroy
      format.js { render 'carts/show.js.erb' }
    end
  end
end
