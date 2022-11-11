Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :show, :new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  post 'authenticate', to: 'authentication#authenticate'

end
