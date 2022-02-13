class ApplicationController < ActionController::Base
    def content_not_found
        render file: "#{Rails.root}/public/404.html", status: :not_found
    end

    def user_error
        render file: "#{Rails.root}/public/422.html",  status: :bad_request
    end

    def user_already_exists
        render file: "#{Rails.root}/public/409.html",  status: :conflict
    end

    def user_unauthorized
        render file: "#{Rails.root}/public/401.html",  status: :unauthorized
    end

    def user_forbidden
        render file: "#{Rails.root}/public/403.html",  status: :forbidden
    end
end
