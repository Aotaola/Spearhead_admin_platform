class ArticlesController < ApplicationController
    before_action :set_article, only: [ :show, :edit, :update, :destroy]
   
    def index
        @query = Article.ransack(params[:q])
        @art = params[:q].blank? ? Article.none : @query.result(distinct: true)
        @articles = Article.paginate(page: params[:page], per_page: 10)
    end
    def show
        @admin = @article.admin
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        @article.admin_id = current_admin.id
        if @article.save
            Log.create(admin: current_admin, article: @article, admin_name: current_admin.name, article_title: @article.title, action: 'Created by')
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
            Log.create(admin: current_admin, article: @article, admin_name: current_admin.name , article_title: @article.title, action: 'Edited by')
            redirect_to @article, notice: "article was successfully updated"
         else
            flash[:notice]= "there was an error saving your correction"
            render :edit
         end
    end
    def destroy
        Log.create(admin: current_admin, admin_name: current_admin.name , article: @article, article_title: @article.title, action: 'Destroyed')
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

end
