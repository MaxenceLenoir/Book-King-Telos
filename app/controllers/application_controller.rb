class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_root_path!, unless: :no_redirection_needed

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  protected

  def redirect_root_path!
    redirect_to root_path
  end

  def no_redirection_needed
    pundit_user || skip_pundit?
  end

  def pundit_user
    current_buyer || current_seller
  end

  def skip_pundit?
    devise_controller? || params[:controller] == "pages" || is_a?(Dashboard::BooksController)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone last_name first_name address])
  end

  def after_sign_in_path_for(_resource)
    if current_buyer
      cart = Cart.find_by(buyer: current_buyer, state: 'pending')
      Cart.create(buyer: current_buyer) unless cart
    end
    root_path
  end
end
