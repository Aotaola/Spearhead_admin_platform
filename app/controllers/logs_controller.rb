class LogsController < ApplicationController

    def show
        @log = Log.find(params[:id])
    end

end
