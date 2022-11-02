# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users

  namespace :v1 do
    post '/sing_in', to: 'sessions#create'
    delete '/sing_out/:id', to: 'sessions#destroy'
  end
end
