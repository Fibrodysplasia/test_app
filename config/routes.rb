# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root is the default route. Here, application has an implicit '_controller' after it,
  # so it is really 'pages_controller#home'. The '#home' tells it to find the 'home' method
  # (also called an action in this context) that is defined inside pages_controller.
  root 'pages#home'
  get 'about', to: 'pages#about'
  #resources :articles, only: %i[show index new create edit update destroy]
  # this gives us the routes for articles
  # can also do resources :some, only: [:show, :edit, :etc] so I only see what
  # I'm working on
  
  
  # after having made all of the things i can expose the routes like this:
  resources :articles
  
  # REST is a representational state transfer -- so a mapping of HTTP verbs
  # (get, post, put/patch, delete) to CRUD actions. 
  # using 'resources', rails provides the RESTful routes for us behind the scenes
end
