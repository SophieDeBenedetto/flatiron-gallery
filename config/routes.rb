Rails.application.routes.draw do
  # resources :collaborations
  root "projects#index"
  resources :users
  get "/profile", to: "users#profile", as: "profile"
  resources :projects
  resources :cohorts

  get '/auth/google_oauth2/callback', to: "sessions#create"
  # auth/google_oauth2/callback
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
