Rails.application.routes.draw do
  resources :surveys
  get '/narnia', to: 'sessions#narnia'
  get '/sign_out', to: 'sessions#sign_out'
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
