class MapsController < ApplicationController
    def index
        @maps = Map.all
    end

    def new
    end

    def create
        @map = Map.create(map_params)
        redirect_to map_path(@map)
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
        redirect_to map_path(@map)
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