Rails.application.routes.draw do
  get '/', to: 'sessions#narnia'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#sign_out'
  get '/questions', to: 'application#questions'
  post '/submit', to: 'surveys#submit'
  get '/thanks', to: 'surveys#thanks'
  resources :users do
    resources :surveys
    resources :responses
  end
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
