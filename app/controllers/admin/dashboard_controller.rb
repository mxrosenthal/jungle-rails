class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"], except: :denied

  def denied
  render plain: "get outa here!"
  end

  def show
    @num_products = Product.count(:name)
    @num_categories = Category.count(:name)
  end
end
