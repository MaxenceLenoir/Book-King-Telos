class CartsController < ApplicationController
  before_action :authenticate_buyer!
  def show
    @cart = Cart.includes(cart_elements: :book).find(params[:id])
    authorize @cart
  end

  def cart_payment
    authorize current_buyer.cart
    PaymentService.new.call(current_buyer) ? 
      redirect_to(cart_path(current_buyer.cart), notice: "You don't have enough money") :
      redirect_to(books_path, notice: "You buy has been approved")
  end
end
