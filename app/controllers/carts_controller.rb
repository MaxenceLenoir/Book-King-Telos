class CartsController < ApplicationController
  before_action :authenticate_buyer!
  def show
    @cart = Cart.includes(cart_elements: :book).find(params[:id])
    authorize @cart
  end
end
