class GardensController < ApplicationController


    def new
        @user
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
        @garden = Garden.find_by_id(params[:id])
    end


    def create
       
        # @garden = current_user.gardens.build(garden_params)
        binding.pry
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
    end

    def update
        @garden.update(garden_params)
        redirect_to garden_path(@garden)
    end

    def destroy
        @garden.destroy
        redirect_to gardens_path
    end

    private
    def garden_params
        params.require(:garden).permit(:name, :location, :user_id)
    end


    

end
