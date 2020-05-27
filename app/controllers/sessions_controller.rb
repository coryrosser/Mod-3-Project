class SessionsController < ApplicationController
  def new
  end

  def return_current_user 
    if logged_in?
    render json: current_user, include: :items
    else
      render json: {status: "Not Logged In", code: 300}
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.password == params[:session][:pw]
      session[:user_id] = user.id
      render json: {
                    status: "success",
                    code: 200,
                    message: "Welcome #{current_user.first_name}!",
                    user: current_user,
                    items: current_user.items
                  }
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

