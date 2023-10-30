class InvoicesController < ApplicationController
    before_action @set_invoice, only [:show, :update, :destroy, :edit]

    def index
        @query = Invoice.ransack(params[:q])
        @art = params[:q].blank? ? Invoice.none : @query.result(distinct: true)
        @invoices = Invoice.paginate(page: params[:page], per_page: 10)
    end
    def show
        
    end
    def edit

    end
    def update
        if @invoice.update(invoice_params)

        end
    end
    def new
        @invoice = Invoice.new
    end
    def create
        @invoice = Invoice.new(invoice_params)
        @invoice.patient_id = 
        if @invoice.save

        end
    end

    private 
    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
    def invoice_params
        params.require(:invoice).permit(:description, :patient_id)
    end
end
