class MapsController < ApplicationController
    def index
        @maps = Map.all
    end

    def new
    end

    def create
        @map = Map.create(map_params)
        if @map.valid?
            redirect_to map_path(@map)
        else
            flash[:alert] = @map.errors.full_messages
            redirect_to new_map_path
        end
    end

    def show
        @map = Map.find(params[:id])
    end

    def edit
        @map = Map.find(params[:id])
    end

    def update
        @map = Map.find(params[:id])
        @map.update(map_params)
        #byebug
        if @map.valid?
            redirect_to map_path(@map)
        else
            flash[:alert] = @map.errors.full_messages
            redirect_to edit_map_path(@map)
        end
    end

    def destroy
        byebug
        @map = Map.find(params[:id])
        @map.destroy
        redirect_to maps_path
    end

    private

    def map_params
        params.require(:map).permit(:name)
    end
end