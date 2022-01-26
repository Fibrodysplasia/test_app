class ArticlesController < ApplicationController
    
    def show
        #the @ is how we create an instance variable
        @article = Article.find(params[:id])
    end
    
    def index #needs an index.html.erb
        @articles = Article.all
        
    end
    
end