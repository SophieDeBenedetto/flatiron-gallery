Rails.application.routes.draw do
  # resources :collaborations
  resources :users
  resources :cohorts do 
    resources :projects
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
