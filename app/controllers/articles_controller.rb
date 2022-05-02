class ArticlesController < ApplicationController
    #here i will use the before_action to set_article rather than
    #call the code each time one of the methods is called
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def show
    end
    
    def index #needs an index.html.erb
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @article = Article.new
        # this instance variable allows the error checking
        # since the first page load would have no errors and
        # thus throw me an error message
    end
    
    def edit
    end
    
    def create
        # using instance so i can access it outside in a bit
        @article = Article.new(article_params)
        # I need to whitelist params
      
        @article.user = current_user
        
        # need to see the object created? Do this
        # render plain: @article.inspect
        
        # remember that an id is generated when you save (thanks rails)
        if @article.save
        # here the flash helper can be assigned a message that essentially
        # works like a hash. The two common keys are :notice and :alert
        # :alert is generally used when something goes wrong. 
            flash[:notice] = 'Article was created successfully.'
            
            
        # here, using rails routes --expanded to see routes
        # there is prefix = article, so append '_path'
        # and the pattern is articles/:id so,
        # path is article_path(@article) and rails will extract the :id
        # from the @article to use in the path
        # redirect_to article_path(@article)
        
        # turns out, you can just shorten the above to
            redirect_to @article #thanks rails
        else
            render 'new'
        end
    end
    
    def update 
        if @article.update(article_params)
            flash[:notice] = 'Article successfully updated.'
            redirect_to @article
        else 
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    
    private #you do not need an 'end' for private, it's not a block
    
    def set_article
        @article = Article.find(params[:id]) 
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own articles."
        redirect_to @article
      end
    end
end
