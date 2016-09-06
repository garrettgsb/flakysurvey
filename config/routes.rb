Rails.application.routes.draw do
  get '/narnia', to: 'sessions#narnia'
  get '/sign_out', to: 'sessions#sign_out'
  get '/questions', to: 'application#questions'
  resources :users do
    resources :surveys
  end
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
