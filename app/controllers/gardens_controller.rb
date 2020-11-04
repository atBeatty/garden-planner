class GardensController < ApplicationController



    def index
        @gardens = Garden.all
    end

    def new
        @garden = Garden.new
    end

    def create
        @garden = Garden.new(garden_params)

        redirect_to garden_path(@garden)

    end
    

end
