
class SessionsController < ApplicationController
    def create
        user = User.where(email: login_params[:email])
        if user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to "/pets"
        else
            flash.alert = "login failed."
            redirect_to "/login"
        end

    end

    private
    def login_params
        params.require(:login).permit(:email, :password)
    end
end
