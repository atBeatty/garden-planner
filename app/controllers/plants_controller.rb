class PlantsController < ApplicationController
before_action :redirect_if_not_logged_in

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
          @user = User.find_by_id(params[:user_id])
          @plant = @user.plants.find_by(id: params[:id])
          if @plant.nil?
            redirect_to user_plants_path(@user), alert: "Plant not found"
          end
        else
          @plant = Plant.find(params[:id])
        end
      end
    

    def create
        @plant = Plant.new(plant_params)
        @plant.user_id = current_user.id
        if @plant.save
          redirect_to @plant
        else
          render new_plant_path
        end
    end

    def edit
      @plant = Plant.find_by_id(params[:id])
    end

    def update
      @plant = Plant.update(plant_params)
      redirect_to plants_path
    end




    private
    def plant_params
        params.require(:plant).permit(:name, :species, :user_id, :garden_id)
    end


    
end



