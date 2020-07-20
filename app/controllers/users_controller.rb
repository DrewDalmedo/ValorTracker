class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    # adding just in case I decide to implement this
    def index
    end

    def new
        if session[:user_id]
            redirect_to root_path
        else
            render 'register'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.omniauth = false
            @user.save
            redirect_to root_path
        else
            flash[:alert] = "That username or email is already in use!"
            redirect_to register_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    # once again, adding just in case
    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def require_login()
        return head(:forbidden) unless session.include? :user_id
    end
    
end