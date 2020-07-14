class UsersController < ApplicationController

    # adding just in case I decide to implement this
    def index
    end

    def new
        render 'register'
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to root_path
        else
            flash[:alert] = "That username or email is already in use!"
            redirect_to register_path
        end
    end

    def show
    end

    def edit
    end

    # once again, adding just in case
    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
    
end