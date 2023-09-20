class LogsController < ApplicationController

    def show
        @log = Log.find(params[:id])
    end

    def index
        @logs = Log.paginate(page: params[:page], per_page: 13)
    end

end
