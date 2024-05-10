Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'books#index'
  resources :books

  # StaticPages
  get '/about' => 'static_pages#about', as: :about
  get '/contact' => 'static_pages#contact', as: :contact

  # Admin
  namespace :admin do
    root to: 'books#index'
    resources :categories do
      collection do
        post 'search', to: 'categories#search', as: :search

      end
    end
    resources :books do
      collection do
        post 'search', to: 'books#search', as: :search
      end
    end
  end
end
