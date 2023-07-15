Rails.application.routes.draw do
  resources :companies
  resources :people

  resources :sessions
  resources :signups, only: %i[new create]
  resources :password_reset_requests, only: %i[new create]
  resources :password_resets, only: %i[new create]

  get :settings, to: 'pages#settings'

  root to: "public/pages#index"

  draw :public

  mount GoodJob::Engine => 'good_job'
end