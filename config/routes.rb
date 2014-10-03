Rails.application.routes.draw do

  root "dashboard#show"

  get '/welcome' => 'welcome#index'
  get 'register' => 'registrations#new', as: :users
  post '/register' => 'registrations#create'
  resources :users
  resources :dashboard
  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
