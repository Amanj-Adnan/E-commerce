class HomeController < ApplicationController
  def index
    @product=Product.all
  end

  def show

  end
end
