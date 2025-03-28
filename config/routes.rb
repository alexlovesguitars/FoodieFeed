Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "pages#landing"
  get "home", to: "pages#home", as: :home

  resources :recipes, only: [:show, :new, :create, :index] do
    member do
      get 'cookmode'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/users/:user_id/cookbooks', to: 'cookbooks#create', as: 'user_cookbooks'
  delete '/users/:user_id/cookbooks/:recipe_id', to: 'cookbooks#destroy', as: 'user_cookbook'
  get '/users/:user_id/cookbooks', to: 'cookbooks#show', as: 'user_cookbook_show'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
