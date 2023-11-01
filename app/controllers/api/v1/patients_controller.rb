module Api

    module V1

        class PatientsController < ApplicationController
            skip_before_action :verify_authenticity_token
            before_action :set_patient, only: [:show]
            before_action :set_invoices, only: [:show]

            def index
                @patients = Patient.all
                render json: @patients
            end

            def show
                render json: {patient: @patient, invoices: @invoices}
            end

            private 

            def set_patient
                @patient = Patient.find(params[:id])
            end

            def set_invoices
                @invoices = @patient.invoices
            end

            protect_from_forgery with: :exception
        end
    end
end