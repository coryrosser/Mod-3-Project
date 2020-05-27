class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]
    def index 
        users = User.all 

        render :json => users
    end
    def show 
        user = User.find_by(id: params[:id])
        render json: user, include: :items
    end

    def create 
        # byebug  
        @user = User.new(user_params)
        if @user.save 
            render json: @user, status: :created
            # new session
            session[:user_id] = @user.id
        else 
            render json: @user.errors, status: :error
        end

    end
    
    def update
        user = User.find_by(id: params[:id])
        key = params[:key]
        value = params[:newValue]
        user.update(key => value)
        if user.save
         render json: {status: "Success", code: 200, user: user}
        else
         render json: {status: "Error", code: 300, message: user.errors}
        end
    end

    def destroy
        user.destroy 
    end

    private 

    def find_user 
        user = User.find_by(id: params[:id])
    end

    def user_params 
        params.require(:user).permit(:first_name, :last_name,:email,:password,:location)
    end

end