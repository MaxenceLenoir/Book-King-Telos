class ProfilesController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
    authorize @buyer
  end
end
