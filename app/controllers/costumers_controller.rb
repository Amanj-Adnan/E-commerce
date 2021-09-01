class CostumersController < ApplicationController

  def new
    @user= User.new
    @costumer = Costumer.new

  end


   def create
     ActiveRecord::Base.transaction do
     print(params)
     @user = User.new(get_user)
     @costumer = Costumer.new
     @user.profileable = @costumer
     @costumer.save!
     @user.save!
     sign_in_and_redirect @user
     end


   end



  private
  def get_user
    params.require(:user).permit(:name,:address,:mobile_number,:email ,:password ,:password_confirmation)
  end

end


