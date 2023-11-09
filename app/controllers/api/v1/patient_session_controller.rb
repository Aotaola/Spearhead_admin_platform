
module Api

  module V1
    
    class PatientSessionController < ApplicationController
      
      skip_before_action :verify_authenticity_token

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
        render json: { notice: 'You have been logged out' }, status: :ok
      end
      
      
    end

  end

end