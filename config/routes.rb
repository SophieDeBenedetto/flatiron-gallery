Rails.application.routes.draw do
  # resources :collaborations
  root "welcome#home"
  resources :users
  resources :projects
  resources :cohorts

  get '/auth/google_oauth2/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: 'logout'
  # auth/google_oauth2/callback
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
