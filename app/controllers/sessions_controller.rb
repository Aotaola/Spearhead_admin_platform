class SessionsController < ApplicationController

    def new

    end
    def create
        admin = Admin.find_by(email: params[:session][:email].downcase)
        if admin && admin.authenticate(params[:session][:password])
            session[:admin_id] = admin.id
            flash[:notice] = "Login successful"
            redirect_to admin
        else 
            render :new
            flash[:notice] = "there was an error creating the session"
        end
    end
    def destroy

    end

end
