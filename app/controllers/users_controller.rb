class UsersController < ApplicationController
    def index
    end
    def signup
    end
    def create
        existing = User.where(email: user_params[:email])
        if existing.count <=1
            user = User.new(user_params)
            user.save
            session[:user_id] = user.id
            redirect_to "/"
        else
            session.delete[:user_id]
            redirect_to "/signup"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password_digest, :password_confirmation)
    end
end
