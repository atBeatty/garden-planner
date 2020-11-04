class WelcomeController < ApplicationController

def home
    if !logged_in?
    render :layout => false
    end

end

end
