Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
  #routes for spa services
  namespace :api do
    namespace :v1 do
      resources :spa_services, only: [:index, :show, :create, :destroy]
    end
  end

  #routes for reservations
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :show, :create, :destroy]
    end
  end

  # end point to get user's reservations
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show ]do
        resources :reservations, only: [:index]
      end
    end
  end
end
