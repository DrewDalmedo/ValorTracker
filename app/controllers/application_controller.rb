class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        if session[:name].nil?
            render 'home'
        end
    end
end
