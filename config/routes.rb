# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  namespace :v1 do
    post 'user/sing_in', to: 'sessions#create'
    post 'user/sing_up', to: 'users#create'
    delete 'user/sing_out/:id', to: 'sessions#destroy'
  end
end
