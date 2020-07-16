class SessionsController < ApplicationController
    # used for developer auth strategy
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
        if request['env'] # if logged in using omniauth
            
        else              # if logged in manually
            login_info = params[:user]
            @user = User.find_by(name: login_info[:name])
            #byebug
            if @user && @user.authenticate(login_info[:password])
                session[:user_id] = @user.id
                redirect_to root_path
            else
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end