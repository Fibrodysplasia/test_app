class ArticlesController < ApplicationController
    
    def show
        #the @ is how we create an instance variable
        @article = Article.find(params[:id])
    end
    
    def index #needs an index.html.erb
        @articles = Article.all
    end
    
    def new
        @article = Article.new
        # this instance variable allows the error checking
        # since the first page load would have no errors and
        # thus throw me an error message
    end
    
    def create
        # using instance so i can access it outside in a bit
        @article = Article.new(params.require(:article).permit(:title, :description))
        # I need to whitelist params
        # using strong params
        
        # need to see the object created? Do this
        # render plain: @article.inspect
        
        # remember that an id is generated when you save (thanks rails)
        if @article.save
        # here the flash helper can be assigned a message that essentially
        # works like a hash. The two common keys are :notice and :alert
        # :alert is generally used when something goes wrong. 
            flash[:notice] = "Article was created successfully."
        # here, using rails routes --expanded to see routes
        # there is prefix = article, so append "_path"
        # and the pattern is article/:id so,
        # path is article_path(@article) and rails will extract the :id
        # from the @article to use in the path
        # redirect_to  article_path(@article)
        
        # turns out, you can just shorten the above to
            redirect_to @article #thanks rails
        else
            render 'new'
        end
    end
    
end