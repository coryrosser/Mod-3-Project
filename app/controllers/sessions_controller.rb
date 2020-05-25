class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.password = params[:session][:pw]
      
      session[:user_id] = user.id
      render json: current_user
      byebug
    else 
      render json: {status: "error", code: 300, message: "Invalid Email or Password"}
    end
    # redirect_to root_url
  end

  def destroy
    session.delete :user_id
  end
  private 
  def current_user
    User.find_by(id: session[:user_id])
  end 

  def logged_in?
    !current_user.nil?  
  end
end

