class SessionsController < ApplicationController
    # used for developer auth strategy
    skip_before_action :verify_authenticity_token, only: :create

    def new
    end

    def create
        session[:name] = request.env['omniauth.auth']['info']['name']
        session[:omniauth_data] = request.env['omniauth.auth']
        redirect_to root_path
    end

    def destroy
    end

    private

    def user_params
        params.permit(:email, :name)
        # in the future keep track of the provider / strategy too:
        #params.permit(:email, :name, :provider)
    end
end