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
        existing = User.where(email: user_params[:email])
        if existing.count <=1 && user_params[:password_digest] == user_params[:password_confirmation]
            user = User.new(user_params)
            user.save
            redirect_to "/"
        else
            redirect_to "/signup"
            @@message = @@message_options[:fail_message]
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password_digest, :password_confirmation)
    end
end
