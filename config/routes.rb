# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users

  namespace :v1 do
    resources :sessions, only: %i[create destroy]
  end
end
