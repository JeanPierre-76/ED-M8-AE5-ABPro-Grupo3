Rails.application.routes.draw do
  resources :politicas
  resources :internacionals
  resources :nacionals
  resources :farandulas
  resources :deportes
  resources :noticia
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "noticia#index"


end
