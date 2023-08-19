Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
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
