Rails.application.routes.draw do
  resources :users, only: %i[new, create]
  get 'verify_email', to: 'users#verify_email'
  root to: 'users#new'
end
