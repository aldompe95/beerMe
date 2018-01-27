Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { registrations: "registrations" }

  root to: "dashboard#index"
  resources :beers
  resources :beer_logs
  resources :dashboard
end
