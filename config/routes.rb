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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
