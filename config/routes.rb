Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "dashboard#index"
  resources :beer_logs do
    collection do
      get :autocomplete
    end
  end
  resources :dashboard do
    collection do
      get :autocomplete
    end
  end
end
