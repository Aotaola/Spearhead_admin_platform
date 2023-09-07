class SessionsController < ApplicationController

    def new

    end
    def create
        admin = Admin.find_by(email: params[:session][:email].downcase)
    end
    def destroy

    end

end
