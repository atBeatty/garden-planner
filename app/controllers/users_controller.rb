class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        
        redirect_to redirect_to user_path(@user)
    end

    def show
        if !logged_in?
            redirect_to '/'
        else
            @user = User.find(params[:id])
        end
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
