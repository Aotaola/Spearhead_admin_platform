class PatientsController < ApplicationController
    before_action :set_patient, only: [:edit, :update, :destroy, :show]

    def index
        @query = Patient.ransack(params[:q])
        @pat = params[:q].blank? ? Patient.none : @query.result(distinct: true)
        @patients = Patient.paginate(page: params[:page], per_page: 10)
    end
    def show
        @invoices = @patient.invoices.paginate(page: params[:page], per_page: 6)

    end
    def edit
        
    end 
    def update
        if @patient.update(patient_params)
            redirect_to @patient, notice: "patient was successfully updated"
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
        params.require(:patient).permit(:first_name, :last_name, :email, :phone_number, :password, :insurance)
    end

end
