
module Api

  module V1
    
    class PatientSessionController < ApplicationController
      protect_from_forgery with: :null_session

      def new
        # Renders the login form for patients
      end
      
      def create
        patient = Patient.find_by(email: params[:email].downcase)
        if patient && patient.authenticate(params[:password])
          session[:patient_id] = patient.id
           render json: { notice: 'Login successful', patient_id: patient.id }
        else
          render json: { alert: 'Invalid email/password combination' }, status: :unauthorized
        end
      end
      
      def destroy
        reset_session
        flash[:notice] = "You have been logged out"
        redirect_to :new # Or the patient's login path
      end
    end

  end

end