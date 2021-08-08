class ShopsController < ApplicationController

  def new
    @user= User.new
    @shop=Shop.new
    @user.profileable = @shop
  end


  def create
    ActiveRecord::Base.transaction do
      puts("LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOL")
      # puts(get_user)
      @user = User.new(get_user)
      @shop = Shop.new(**get_shop_params.to_h[:profileable_attributes])
      @user.profileable = @shop
      # @user.build_profileable()
      @shop.save!
      @user.save!
      sign_in @shop.user
      redirect_to root_path
    end
  end



  private
  def get_user
    params.require(:user).permit(:name,:address,:mobile_number,:email ,:password ,:password_confirmation)
  end


  def get_shop_params
    params.require(:user).permit(profileable_attributes: [:category])

    end

end

# user_attributes: [:name,:address,:mobile_number,:email ,:password ,:password_confirmation]
