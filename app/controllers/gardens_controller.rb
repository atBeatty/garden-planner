class GardensController < ApplicationController


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
    end

    def show
        @garden = Garden.find_by_id(params[:id])
    end

    def create
        @garden = Garden.create(garden_params)
        @garden.users << current_user
        
        if @garden.save
            redirect_to garden_path(@garden)
        else
            render new_user_garden_path
        end

    end

    def edit
        @garden = Garden.find_by_id(params[:id])
        @user_flowers = current_user.plants
    end

    def update
        @garden = Garden.find_by_id(params[:id])
        @garden.update(garden_params)
        redirect_to garden_path(@garden)
    end

    def destroy
        @garden.destroy
        redirect_to gardens_path
    end

    private
    def garden_params
        params.require(:garden).permit(:name, :location, plants_attributes: [:garden_id])
    end


    

end
