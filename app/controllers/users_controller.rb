class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
    end


    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
