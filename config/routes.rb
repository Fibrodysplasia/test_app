Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root is the default route. Here, application has an implicit '_controller' after it, 
  #so it is really 'pages_controller#home'. The #hello tells it to find the 'home' method
  #(also called an action in this context) that is defined inside pages_controller.
  root 'pages#home'
  get 'about', to: 'pages#about'
end
