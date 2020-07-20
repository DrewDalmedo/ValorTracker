require 'securerandom' # for assigning random passwords to omniauth logins

class SessionsController < ApplicationController
    # used for auth strategies
    skip_before_action :verify_authenticity_token, only: :create

    def new
        if session[:user_id]
            redirect_to root_path
        else
            render 'login'
        end
    end

    def create
        #byebug
        if auth # if logged in using omniauth
            @user = User.find_by(email: auth['info']['email'])
            sessions_helper.check_if_user_exists @user, auth, flash
            session[:user_id] = @user.id
            redirect_to root_path
        else    # if logged in manually
            login_info = params[:user]
            @user = User.find_by(name: login_info[:name])
            #byebug
            if @user && @user.authenticate(login_info[:password])
                session[:user_id] = @user.id
                redirect_to root_path
            else
                flash[:alert] = "Invalid username or password!"
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def sessions_helper
        ApplicationController.helpers
    end

    def auth
        request.env['omniauth.auth']
    end

end