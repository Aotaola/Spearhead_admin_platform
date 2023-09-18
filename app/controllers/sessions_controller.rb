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
            flash.now[:notice] = "there was an error creating the session"
            render :new
        end
    end
    def destroy
        reset_session
        flash[:notice] = "you have been logged out"
        redirect_to root_path
    end

end
