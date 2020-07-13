class SessionsController < ApplicationController
    # used for developer auth strategy
    skip_before_action :verify_authenticity_token, only: :create

    def new
        if session[:name]
            redirect_to root_path
        end
        render 'login'
    end

    def create
        login_info = params[:user]
        @user = User.find_by(name: login_info[:name])
        #byebug
        if @user && @user.authenticate(login_info[:password])
            session[:name] = @user.name
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete :name
        redirect_to root_path
    end

end