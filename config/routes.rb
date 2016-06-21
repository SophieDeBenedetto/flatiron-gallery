Rails.application.routes.draw do
  resources :collaborations
  resources :projects
  resources :users
  resources :cohorts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
