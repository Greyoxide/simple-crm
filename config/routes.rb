Rails.application.routes.draw do
  resources :companies do
    resources :proposals, only: [:new, :create]
  end
  resources :people

  resources :proposals, except: [:new, :create]

  root to: "companies#index"
end