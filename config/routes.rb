Rails.application.routes.draw do

  root "dashboard#show"

  get '/welcome' => 'welcome#index'
  get 'register' => 'registrations#new', as: :users
  post '/register' => 'registrations#create'
  resources :users do
    resources :comments
    resources :follows
    resources :rants do
      resources :comments
      resources :favorites
    end
  end
  resources :dashboard, only: [:show]
  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  post '/dashboard/:id' => 'rants#create'

  post '/users/:id/follows/:id' => 'follows#create'
  get '/users/:user_id/favorites' => 'favorites#index', as: :favorites

  resources :search
  get '/rants/:rant_id/spam' => 'rants#spam', as: :spam
  get '/rants/:rant_id/unspam' => 'rants#unspam', as: :unspam

  get '/admin/dashboard' => 'admins#dashboard'
  get '/admin/rants' => 'admins#rants'
  get '/admin/users' => 'admins#users'
  get '/admin/spam' => 'admins#spam'
  post '/disable/:id' => 'admins#disable', as: :disable
end
