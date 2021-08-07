class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   case current_user.profileable_type
  #   when "Costumer"
  #     return user_type_1_index_path
  #   when "Shop"
  #     return user_type_1_index_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:name, :mobile_number , :address)
  end
end
