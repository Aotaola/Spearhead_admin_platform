class AdminsController < ApplicationController

    before_action :set_admin, only: [:show, :edit, :update, :destroy ]

    def show
        @articles = @admin.articles.paginate(page: params[:page], per_page: 6)
    end
    def new
        @admin = Admin.new
    end
    def create
        @admin = Admin.new(admin_params)
            if @admin.save
                redirect_to @admin, notice: "your admin profile was successfully created"
            else
                render_errors (@admin)
                render :new
            end
    end
    def edit

    end
    def update

        if @admin.update(admin_params)
            redirect_to @admin, notice: "your admin profile was successfully updated"
        else
            render_errors (@admin)
            render :edit
        end

    end
    def destroy
        @admin.destroy
        redirect_to root_path, notice: "your admin profile was successfully destroyed"

    end

    private 

    def set_admin
        @admin = Admin.find(params[:id])
    end
    def admin_params
        params.require(:admin).permit(:name, :email, :password, :photo)
    end

end
