
class SessionsController < ApplicationController
    def create
        @user = User.where(email: login_params[:email])
        if @user
            session[:user] = login_params[:email]
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
