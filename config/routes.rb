Rails.application.routes.draw do
  root to: 'tickets#index'

  namespace :api do
    resources :tickets, only: %i[create]
  end

  resources :tickets, except: %i[create]
end
