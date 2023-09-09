class ApplicationController < ActionController::Base

    helper_method :current_admin
    before_action :logged_in
    
    private
    def current_admin
        @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end
    def logged_in
        !!current_admin
    end
end
