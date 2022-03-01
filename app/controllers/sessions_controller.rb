
class SessionsController < ApplicationController
    @@logged_in = false
    def create
        @user = User.where(email: login_params[:email])
        if @user
            session[:user] = login_params[:email]
            redirect_to "/pets"
            @@logged_in = true
        else
            @@logged_in = false
            flash.alert = "login failed."
            redirect_to "/login"
        end

    end
    def self.logged_in
       return @@logged_in
    end

    private
    def login_params
        params.require(:login).permit(:email, :password)
    end
end
