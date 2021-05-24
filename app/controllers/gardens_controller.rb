class GardensController < ApplicationController
before_action :redirect_if_not_logged_in

    def new
      @garden = Garden.new
  
    end

    def index
      if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        if @user.nil?
          redirect_to users_path, alert: "user not found"
        else
          @gardens = @user.gardens
        end
      else
        @gardens = Garden.all
      end
    end
    
      def show
        if params[:user_id]
          @user = User.find_by_id(params[:user_id])
          @garden = @user.gardens.find_by(id: params[:id])
          if @garden.nil?
            redirect_to user_gardens_path(@user), alert: "Garden not found"
          end
        else
          @garden = Garden.find(params[:id])
        end
      end
    

    def create
        @garden = current_user.gardens.build(garden_params)
        if @garden.save
          redirect_to @garden
        else
          render new_garden_path
        end
    end

    def edit
      @garden = Garden.find_by_id(params[:id])
      
    end

    def update
      @garden = Garden.update(garden_params)
      redirect_to gardens_path
    end

    def destroy
      @garden = Garden.find_by_id(params[:id])

      @garden.destroy
      redirect_to gardens_path
    end




    private
    def garden_params
        params.require(:garden).permit(:name, :species)
    end


    end
    