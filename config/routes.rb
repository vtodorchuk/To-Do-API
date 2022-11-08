Rails.application.routes.draw do
  namespace :v1 do
    post 'user/sing_in', to: 'sessions#create'
    post 'user/sing_up', to: 'users#create'
    delete 'user/sing_out', to: 'sessions#destroy'
    post 'user/refresh', to: 'refresh#create'
  end
end
