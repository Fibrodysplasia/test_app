class PagesController < ApplicationController
#above, the < indicates the PagesController is inheriting from ApplicationController
  def home
    #by convention, this expects a home.html.erb template, so no more code necessary
  end
  
  def about
  end
end
