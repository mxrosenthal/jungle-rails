class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"], except: :denied

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
end
