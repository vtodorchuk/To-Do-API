# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :v1 do
    post 'user/sing_in', to: 'sessions#create'
    post 'user/sing_up', to: 'users#create'
    delete 'user/sing_out', to: 'sessions#destroy'
    post 'user/refresh', to: 'refresh#create'

    resources :projects, only: %i[create destroy show update]
  end
end
