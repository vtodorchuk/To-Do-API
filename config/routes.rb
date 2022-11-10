Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create destroy]
      resources :refresh, only: :create

      resource :session, only: %i[create destroy]

      resources :projects do
        resources :tasks do
          resources :comments
        end
      end
    end
  end
end
