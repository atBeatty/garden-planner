class PlantsController < ApplicationController
    def new
        @plant = Plant.new
    end

    def index
        if params[:user_id]
          @user = User.find_by(id: params[:user_id])
          if @user.nil?
            redirect_to users_path, alert: "user not found"
          else
            @plants = @user.plants
          end
        else
          @plants = Plant.all
        end
      end
    
      def show
        if params[:user_id]
          @user = User.find_by(id: params[:user_id])
          @plant = @user.plants.find_by(id: params[:id])
          if @plant.nil?
            redirect_to user_plants_path(@user), alert: "Plant not found"
          end
        else
          @plant = plant.find(params[:id])
        end
      end
    

    def create
        @plant = Plant.create(plant_params)
        redirect_to plants_path
    end


    private
    def plant_params
        params.require(:plant).permit(:name, :species)
    end


    
end



