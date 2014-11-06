Rails.application.routes.draw do

  root "dashboard#show"

  get '/welcome' => 'welcome#index'
  get 'register' => 'registrations#new', as: :users
  post '/register' => 'registrations#create'
  resources :users do
    resources :follows
    resources :rants do
      resources :favorites
    end
  end
  resources :dashboard
  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  post '/dashboard/:id' => 'rants#create'

  post '/users/:id/follows/:id' => 'follows#create'
  get '/users/:user_id/favorites' => 'favorites#index', as: :favorites

  resources :search
end
