# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :v1 do
    namespace :users do
      post '/sing_in', to: 'sessions#create'
      post '/sing_up', to: 'users#create'
      delete '/sing_out', to: 'sessions#destroy'
      post '/refresh', to: 'refresh#create'
    end

    resources :projects, only: %i[create destroy show update] do
      resources :tasks, only: %i[create destroy show update]
    end
  end
end
