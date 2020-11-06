class GardensController < ApplicationController
before_action :redirect_if_not_logged_in

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

    def new
        @garden = Garden.new
        @user_plants = current_user.plants
    end

    def show
        @garden = Garden.find_by_id(params[:id])
    end

    def create
        @garden = Garden.new(garden_params)

        @garden.users << current_user
        if @garden.save
            redirect_to garden_path(@garden)
        else
            render new_user_garden_path
        end
    end

    def edit
        @garden = Garden.find_by_id(params[:id])
        @user_plants = current_user.plants
    end
    
    def update
        @garden = Garden.find_by_id(params[:id])
        @plant = Plant.find_by(name: params[:garden][:plants_attributes][:name])
        @garden.plants << @plant
        @garden.update(garden_params)
        redirect_to garden_path(@garden)
    end

    def destroy
        @garden = Garden.find_by_id(params[:id])
        @garden.destroy
        redirect_to gardens_path
    end

    private
    
    def garden_params
        params.require(:garden).permit(:name, :location)
    end


    

end
