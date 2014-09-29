Rails.application.routes.draw do

  root "welcome#index"

  resources :users
  resources :dashboards
end
