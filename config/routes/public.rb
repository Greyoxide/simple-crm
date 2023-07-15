namespace :public do
  root to: 'pages#index'

  resources :sessions
  resources :signups, only: %i[new create]
  resources :password_reset_requests, only: %i[new create]
  resources :password_resets, only: %i[new create]

end