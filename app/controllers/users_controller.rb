class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_or_create_by(user_params)

        redirect_to users_path

    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
