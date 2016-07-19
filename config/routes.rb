Rails.application.routes.draw do
  # resources :collaborations
  root "projects#index"
  resources :users
  # get "/profile", to: "users#profile", as: "profile"
  get "/profile", to: "profiles#show", as: "profile"
  resources :projects
  resources :cohorts

  get '/auth/google_oauth2/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout'
  get '/dashboard', to: 'dashboards#show', as: 'dashboard'
  get '/request_access', to: "email_registration#request_admin", as: 'request_admin'
  get '/confirm_admin/:token', to: "email_registration#confirm_admin", as: 'confirm_admin'
  
# auth/google_oauth2/callback
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
