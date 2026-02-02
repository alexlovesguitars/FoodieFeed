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
      # get 'copy_ingredients'
      # post 'copy_ingredients'
    end
    resources :reviews, only: [:new, :create]
    resource :note, only: [:create, :update]
  end

  get '/users/:user_name', to: 'users#show', as: :user_profile
  get 'search', to: 'pages#search', as: 'search'


  resources :favorites, only: [:index, :create, :destroy]

  # resources :users, only: [:show]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
