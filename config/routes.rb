Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create destroy]
      resources :refresh, only: :create
      resources :sessions, only: %i[create destroy]
    end
  end
end
