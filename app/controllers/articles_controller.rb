class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        articles = Article.all
        render articles 
    end
    def show

    end
    def new

    end
    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article, notice: "article was successfully created"
         else
            render_errors(@article)
            render :new
         end
    end
    def edit

    end
    def update
        @article = Article.update(article_params)
        if @article.save
            redirect_to @article, notice: "article was successfully updated"
         else
            render_errors(@article)
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
        params.require(:article).permit(:title, :body, :photo)
    end

end
