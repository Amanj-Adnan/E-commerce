class ProductsController < ApplicationController
 before_action :authenticate_user!
 # before_action :is_that_shop, only: [:index]


 def index
 @product= Product.all
 end

 def show

 end

 def new
  @new_product = Product.new
  authorize @new_product
 end

 def create
  @new_product = current_user.profileable.products.new(get_params)
  if @new_product.save

   redirect_to root_path
  else
   render :new
  end
 end

 def edit

 end

 def update

  if @product.update(get_params)

   redirect_to porducts_path

  else
   render :edit
  end

 end

 def destroy
  @product.destroy
  redirect_to porducts_path
 end

 private

 def get_params
  params.require(:product).permit(:name,:category,:details ,:image)
 end

end

