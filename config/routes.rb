Rails.application.routes.draw do

  root "welcome#index"

  resources :users
  resources :dashboards
  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
