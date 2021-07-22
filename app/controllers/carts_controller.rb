class CartsController < ApplicationController
  before_action :authenticate_buyer!
  def show
    @cart = Cart.includes(cart_elements: :book).find(params[:id])
    authorize @cart
  end

  def cart_payment
    cart = current_buyer.cart
    cart.update(amount: cart.books.sum(&:price))
    authorize cart
    if current_buyer.account_money < cart.amount
      redirect_to cart_path(cart), notice: "You don't have enough money"
    else
      cart.update(state: "paid")
      current_buyer.update(account_money: current_buyer.account_money - cart.amount)
      Cart.create(buyer: current_buyer)
      redirect_to books_path, notice: "You buy has been approved"
    end
  end
end
