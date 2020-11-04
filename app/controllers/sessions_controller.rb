require 'pry'


class SessionsController < ApplicationController
    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create

        @user = User.find_by(email: params[:email])
        if @user[:password] != params[:password]
            render 'sessions/new'
        else
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end

    def destroy
        session.destroy
        redirect_to '/'
    end
end