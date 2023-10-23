module Api

    module V1
        

        class ServicesController < ApplicationController

            skip_before_action :verify_authenticity_token
            before_action :set_service, only: [:show]

            def index
                @services = Service.order(created_at: :desc).paginate(page: params[:page], per_page: params[:per_page])
                render json: @services
            end

            def show
                render json: @service
            end
        
            private 
          
            def set_service
                @service = Service.find(params[:id])
            end

            protect_from_forgery with: :exception

        end

    end

end