module Api

    module V1

        class ArticlesController < ApplicationController
            
            skip_before_action :verify_authenticity_token

            before_action :set_article, only: [ :show, :edit, :update, :destroy]
            
            def index
                @articles = Article.all 
                render json: @articles
            end
            def show
                render json: @article
            end
            def new
                @article = Article.new
            end
            def create
                @article = Article.new(article_params)
                @article.admin_id = current_admin.id
                if @article.save
                    redirect_to @article, notice: "article was successfully created"
                else
                    flash[:alert] = "there was an error creating the article"
                    render :new
                end
            end
            def edit
                
            end
            def update
                if @article.update(article_params)
                    redirect_to @article, notice: "article was successfully updated"
                else
                    flash[:notice]= "there was an error saving your correction"
                    render :edit
                end
            end
            def destroy
                @article.destroy
                redirect_to articles_path, notice: "article was successfully destroyed"
            end
            
            private 
            def set_article
                @article = Article.find(params[:id])
            end
            def article_params
                params.require(:article).permit(:title, :description, :body, :photo, :admin_id)
            end

            protect_from_forgery with: :exception

            
        end

    end

end
        