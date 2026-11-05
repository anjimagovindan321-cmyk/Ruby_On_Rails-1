class ArticlesController < ApplicationController
    def show
        @article= Article.find(params[:id])
    end
    def index
        @article = Article.all
    end
    def new
        @articles=Article.new
    end
    def create
        @articles = Article.new(params.require(:article).permit(:title, :description))
        if @articles.save
            flash[:notice]="Article was created successfully"
            redirect_to @articles
        else
            
            render 'new'
        end
    end
    def edit
        @article=Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
       if  @article.update(params.require(:article).permit(:title,:description))
          flash[:notice] = "article was updated successfully"
          redirect_to @article
       else
        render 'edit'
       end 
    end
    
    
end