require 'pry'


class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_if_not_logged_in
        end

    end

    def destroy
        session.destroy
        redirect_to '/'
    end


end