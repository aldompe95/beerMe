Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "dashboard#index"
  resources :dashboard do
    collection do
      get :autocomplete
    end
  end
end
