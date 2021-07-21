class PagesController < ApplicationController
  def home
    redirect_to books_path if pundit_user
  end
end
