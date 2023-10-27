class PatientsController < ApplicationController
    before_action :set_article, only [:edit, :update, :destroy, :show]

    def index
        @patients = Patient.all
        render @patients
    end
    def show
         @invoices = @patient.invoices
    end
    def edit
        
    end 
    def update
        if @patient.update(patient_params)
            redirect_to @article, notice: "article was successfully updated"
         else
            render :edit
            flash[:notice]= "there was an error saving your edit. Please try again"
         
        end
    end
    def new
        @patient = Patient.new
    end
    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            redirect_to @patient, notice: "patient was successfully created"
        else 
            render :new,
            flash[:notice]= " there was an error creating your profile, please try again"
        end
    end
    def destroy
        @patient.destroy
        redirect_to :new,
        flash[:message] = "your profile has been deleted"
    end

    private 

    def set_patient
        @patient = Patient.find(params[:id])
    end
    def patient_params
        params.require(:patient).permit(:name, :email, :insurance)
    end

end
