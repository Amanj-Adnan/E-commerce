class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    case current_user.profileable_type
    when "Costumer"
      return root_path
    when "Shop"
      return root_path
    end
  end

  def is_that_shop
    puts(current_user.profileable_type)
    case current_user.profileable_type
    when "Costumer"
      return root_path
    #  change return to redirect to it will work
    when "Shop"
      return product_path
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile_number , :address])
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
