Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create destroy]
      resources :refresh, only: :create
      
      resource :session, only: %i[create destroy]

      resources :projects
    end
  end
end
