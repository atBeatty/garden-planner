class ApplicationController < ActionController::Base
helper_method :logged_in?, :current_user, :redirect_if_logged_in, :redirect_if_not_logged_in
    
        def logged_in? 
          !!session[:user_id]
        end
    
        # def admin_logged_in?
        #   session[:user_id] == 8
        # end 
        
        def current_user
          @user ||= User.find_by_id(session[:user_id])
        end 
    
        def redirect_if_not_logged_in
          if !logged_in?
            flash[:errors] = "You have to be logged in to view this page."
            redirect_to "/login"
          end 
        end 
    
        def redirect_if_logged_in 
          if logged_in?
            redirect_to "/"
          end 
        end 
      
      
    
    
end
