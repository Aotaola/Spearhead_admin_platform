module Api

    module V1

        class ArticlesController < ApplicationController

            skip_before_action :verify_authenticity_token
            before_action :set_article, only: [:show]

            def index
                @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: params[:per_page]) 
                render json: @articles
            end

            def show
                render json: @article
            end

            private 

            def set_article
                @article = Article.find(params[:id])
            end

            protect_from_forgery with: :exception

        end

    end

end
        