class GuidesController < ApplicationController
    def index
        @guides = Guide.all
    end

    def new
        @user = User.find(session[:user_id])
    end

    def create
        byebug
        @guide = Guide.create(guide_params)
        redirect_to guide_path(@guide)
    end

    def show
        @guide = Guide.find(params[:id])
    end

    def edit
        @user = User.find(session[:user_id])
        @guide = Guide.find(params[:id])
    end

    def update
        @guide = Guide.find(params[:id])
        @guide.update(guide_params)

        redirect_to guide_path(@guide)
    end

    def destroy
        @guide = Guide.find(params[:id])
        @guide.destroy
        redirect_to guides_path
    end

    private

    def guide_params
        params.require(:guide).permit(:title, :body, :user_id, :map_id)
    end
end