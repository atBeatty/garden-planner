class PlantsController < ApplicationController
    def new
        @plant = Plant.new
    end

    def index
        redirect_if_not_logged_in
        @plants = Plant.all
    end

    def show
        @plant = Plant.find_by_id(params[:id])
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
