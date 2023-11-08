module Api

    module V1

        class PatientsController < ApplicationController
            skip_before_action :verify_authenticity_token
            before_action :set_patient, only: [:show, :update, :destroy]
      
            # GET /patients
            def index
              @patients = Patient.all
              render json: @patients
            end
      
            # GET /patients/:id
            def show
              render json: { patient: @patient, invoices: @patient.invoices }
            end
      
            # POST /patients
            def create
              @patient = Patient.new(patient_params)
              if @patient.save
                render json: @patient, status: :created, location: api_v1_patient_url(@patient)
              else
                render json: @patient.errors, status: :unprocessable_entity
              end
            end
      
            # PATCH/PUT /patients/:id
            def update
              if @patient.update(patient_params)
                render json: @patient
              else
                render json: @patient.errors, status: :unprocessable_entity
              end
            end
      
            # DELETE /patients/:id
            def destroy
              @patient.destroy
              render json: { message: 'Patient profile has been deleted' }, status: :ok
            end
      
            private
      
            def set_patient
              @patient = Patient.find(params[:id])
            end
      
            def patient_params
              params.require(:patient).permit(:first_name, :last_name, :insurance, :phone_number, :email, :password)
            end
        end
    end
end