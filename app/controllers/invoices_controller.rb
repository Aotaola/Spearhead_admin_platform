class InvoicesController < ApplicationController
    before_action @set_invoice, only [:show, :update, :destroy, :edit]

    def index
        @invoices = Invoice.all
    end
    def show

    private 
    def set_invoice
        @invoice = Invoice.find(params[:id])
    end
    def invoice_paras
        params.require(:invoice).permit(:description, :patient_id)
    end
end
