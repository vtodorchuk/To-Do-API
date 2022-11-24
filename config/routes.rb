Rails.application.routes.draw do
  default_url_options host: 'localhost:3000' if Rails.env.development? || Rails.env.test?

  default_url_options host: ENV['HOST_DOMAIN'] if Rails.env.production?

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create destroy]
      resources :refresh, only: :create

      resource :session, only: %i[create destroy]

      resources :projects do
        resources :tasks, shallow: true do
          resources :comments
        end
      end
    end
  end
end
