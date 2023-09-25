class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :edit, :update, :destroy]
   
    def index
        @query = Service.ransack(params[:q])
        @art = params[:q].blank? ? Service.none : @query.result(distinct: true)
        @services = Service.paginate(page: params[:page], per_page: 10)
    end
    def show
    
    end
    def new
        @service = Service.new
    end
    def create
        @service = Service.new(service_params)
        if @service.save
            Log.create(admin: current_admin, service: @service, admin_name: current_admin.name, service_title: @service.title, article: nil, article_title: nil, action: "Created by #{current_admin.name}")
            redirect_to @service, notice: "service was successfully created"
         else
            flash[:alert] = "there was an error creating the service"
            render :new
         end
    end
    def edit

    end
    def update
        if @service.update(service_params)
            Log.create!(admin: current_admin, service: @service, admin_name: current_admin.name, service_title: @service.title, article: nil, article_title: nil, action: "Edited by #{current_admin.name}")
            redirect_to @service, notice: "service was successfully updated"
         else
            flash[:notice]= "there was an error saving your correction"
            render :edit
         end
    end
    def destroy
        Log.create(admin: current_admin, service: @service, admin_name: current_admin.name, service_title: @service.title, article: @article, article_title: @article, action: "Destroyed by #{current_admin.name}")
        @service.destroy
        redirect_to services_path, notice: "service was successfully destroyed"
    end

    private 
  
    def set_service
        @service = Service.find(params[:id])
    end
    def service_params
        params.require(:service).permit(:title, :description, :url)
    end
end
