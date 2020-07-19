class GuidesController < ApplicationController
    before_action :require_login, except: [:index, :show]
    before_action :check_if_same_author, except: [:index, :show, :new, :create]

    def index
        @guides = Guide.all
    end

    def new
        @user = User.find(session[:user_id])
    end

    def create
        @guide = Guide.create(guide_params)
        if @guide.valid?
            redirect_to guide_path(@guide)
        else
            flash[:alert] = @guides.errors.full_messages
            redirect_to new_user_guide_path(params[:user_id])
        end
    end

    def show
        @guide = Guide.find(params[:id])
    end

    def edit
        @user = User.find(session[:user_id])
        @guide = Guide.find(params[:id])
    end

    def update
        #byebug
        @guide = Guide.find(params[:id])
        @guide.update(guide_params)

        if @guide.valid?
            redirect_to user_guide_path(@guide.user, @guide)
        else
            flash[:alert] = @guide.errors.full_messages
            redirect_to edit_user_guide_path(@guide.user, @guide)
        end
        
    end

    def destroy
        #byebug
        @guide = Guide.find(params[:id])
        @guide.destroy
        redirect_to guides_path
    end

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def check_if_same_author
        if params[:guide]
            puts "bazinga"
            return head(:forbidden) unless params[:guide][:user_id] == session[:user_id].to_s
        else
            puts "billy bongo"
            return head(:forbidden) unless params[:user_id] == session[:user_id].to_s
        end
        
    end

    def guide_params
        params.require(:guide).permit(:title, :body, :user_id, :map_id)
    end
end