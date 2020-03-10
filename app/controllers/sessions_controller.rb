class SessionsController < ApplicationController
  def new
  end

 
  def create
    #trims leading and trailing spaces.
  
    if user = User.authenticate_with_credentials(params[:email].strip, params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
