Rails.application.routes.draw do
  get 'welcomes/index'
  get 'passwords/new'
  get 'sessions/new'
  get 'sign_up', to: "registrations#new"
  post 'sign_up', to: "registrations#create"
  post '/sessions/new', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/users/:user_id/articles/main', to: 'articles#main'
  get 'articles/index', to: 'articles#index'
  get ':id/display', to: 'articles#display'

  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles
  # Defines the root path route ("/")
  root 'welcomes#index'
  resources :sessions
  resources :passwords 
  resources :registrations
  resources :welcomes
  resources :users do
  resources :articles do
    resources :comments
  end
end
end
