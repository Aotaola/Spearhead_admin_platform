class LogsController < ApplicationController

    def show
        @log = Log.find(params[:id])
    end

    def index
        @logs = Log.all
    end

end
