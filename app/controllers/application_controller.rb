class ApplicationController < ActionController::API
    def current_user
        @current_user ||= User.find_by(id: session[:id])
    end
    helper_method :current_user
end
