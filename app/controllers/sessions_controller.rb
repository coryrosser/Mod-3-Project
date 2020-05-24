class SessionsController < ApplicationController
  def new
  end

  def create
    session[:email] = params[:email]
    # redirect_to root_url
  end

  def destroy
    session.delete :username
  end
end

