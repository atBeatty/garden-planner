class GardensController < ApplicationController


    def new
        
        @garden = Garden.new
    end

    def index
        @gardens = Garden.all
    end


    def show
        @garden = Garden.find_by_id(params[:id])
    end


    def create
       
        @garden = Garden.new(garden_params)
        @garden.user_id = current_user.id
        if @garden.save
            redirect_to user_garden_path(@user)
        else
            render new_user_garden_path
        end

    end

    def edit
        @garden = Garden.find_by_id(params[:id])
    end

    def update
        @garden.update(garden_params)
        redirect_to garden_path(@garden)
    end

    def destroy
        
    end

    private
    def garden_params
        params.require(:garden).permit(:name, :location, :user_id)
    end


    

end
