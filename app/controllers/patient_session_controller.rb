class PatientSessionController < ApplicationController
    def new
        # Renders the login form for patients
      end
    
      def create
        patient = Patient.find_by(email: params[:session][:email].downcase)
        if patient && patient.authenticate(params[:session][:password])
          session[:patient_id] = patient.id
          flash[:notice] = "Login successful"
          redirect_to patient_path(patient) # Or whatever your patient show path is
        else 
          flash.now[:alert] = "Invalid email/password combination"
          render :new
        end
      end
    
      def destroy
        reset_session
        flash[:notice] = "You have been logged out"
        redirect_to :new # Or the patient's login path
      end
end
