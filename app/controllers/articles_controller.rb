class ArticlesController < ApplicationController
    
    def show
        #the @ is how we create an instance variable
        #
        @article = Article.find(params[:id])
    end
    
end