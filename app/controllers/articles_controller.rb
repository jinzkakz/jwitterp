 class ArticlesController < ApplicationController
    def index
        @articles = Article. search(params[:search])
#        @articles = Article.all
    end
    
    def new
        @articles = Article.new
    end
    
    def create
        @article = Article.new(allowed_params)
        @article = logged_in?.articles.new(allowed_params)
        
        if @article.save
            redirect_to root_path
        else
            redirect_to @article, notice: 'Unable to create article.Please try again.'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update 
        @article = Article.find(params[:id])
        if @article.update_attributes(allowed_params)
            redirect_to @article, notice: 'Article has been updated'
        else 
            render :edit
        end
    end

    def destroy
        @article = Article.find_by(id: params[:id])
        @article.destroy
            redirect_to @article, notice: 'Article has been deleted'
    end

  private 

  def allowed_params
  	params.require(:article).permit(:name, :author, :content)
  end    
end