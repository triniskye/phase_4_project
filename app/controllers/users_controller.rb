class UsersController < ApplicationController
    @@success = true
    @@message_options = {:success_message => "", :fail_message => "Error, passwords do not match OR user already exists. "}
    @@message = ""
    def login
    end
    def signup
        @display = @@message
    end
    def create

        if User.where(email: user_params[:email]).count < 1 
            user = User.new(user_params)
            user.save
            redirect_to "/login"
        else
            redirect_to "/signup"
            flash.alert = "Error! User already exists."
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
    end
end
