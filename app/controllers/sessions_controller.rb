class SessionsController < ApplicationController
    # used for developer auth strategy
    skip_before_action :verify_authenticity_token, only: :create

    def new
    end

    def create
        byebug

        @user = User.find_by(name: params[:name])
        session[:name] = @user.name if @user

        redirect_to root_path
    end

    def destroy
    end

end