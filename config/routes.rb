Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :spaces do
    resources :bookings, only: [:create, :update] do
      member do
        get 'confirmation', to: 'bookings#confirmation'
      end
    end
  end

  resources :bookings, only: [:show]

  get '/users/:user_id/bookings', to: 'bookings#index', as: :user_bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
