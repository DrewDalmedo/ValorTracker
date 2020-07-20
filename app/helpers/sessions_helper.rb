module SessionsHelper
    def check_if_user_exists(user, auth, flash)
        if user && user.omniauth == false
            flash[:alert] = "A user with your email already exists!"
            redirect_to login_path
        elsif user.nil?
            user = User.new()
            user.name = auth['info']['name']
            user.email = auth['info']['email']
            user.password = SecureRandom.hex
            user.omniauth = true
            user.save
        end
    end
end