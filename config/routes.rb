Rails.application.routes.draw do
  devise_for :users
  #rooutes for spa services
  namespace :api do
    namespace :v1 do
      resources :spa_services, only: [:index, :show]
    end
  end

  #rooutes for reservations
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :show, :create, :destroy]
    end
  end
end
