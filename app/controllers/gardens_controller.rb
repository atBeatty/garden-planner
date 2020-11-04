class GardensController < ApplicationController



    def index
        @gardens = Garden.all
    end

    def new
        @garden = Garden.new
    end

    def show
        @garden = Garden.find_by_id(params[:id])
        
    end


    def create
        @garden = Garden.new(garden_params)
        @garden.save
        redirect_to garden_path(@garden)
    end

    def edit
        @garden = Garden.find_by_id(params[:id])
    end

    def update
        @garden.update(garden_params)
    end

    def destroy
        
    end

    private
    def garden_params
        params.require(:garden).permit(:name, :location)
    end


    

end
