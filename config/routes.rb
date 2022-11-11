Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create destroy]
      resources :refresh, only: :create

      post 'sing_in', to: 'sessions#create'
      delete 'sing_out', to: 'sessions#destroy'
    end
  end
end
