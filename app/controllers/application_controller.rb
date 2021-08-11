class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
    devise_parameter_sanitizer.permit(:name, :mobile_number , :address)
  end
end
