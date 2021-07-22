class ProfilesController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
    authorize @buyer
  end

  def edit
    @buyer = Buyer.find(params[:id])
    authorize @buyer
  end

  def update
    @buyer = Buyer.find(params[:id])
    authorize @buyer
    if @buyer.update(profiles_params)
      redirect_to profile_path(@buyer), notice: "Your profile has been updated"
    else
      render :edit
    end
  end

  private

  def profiles_params
    params.require(:buyer).permit(:first_name, :last_name, :address, :email)
  end
end
