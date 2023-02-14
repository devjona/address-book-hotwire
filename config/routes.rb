Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  root to: 'people#index'

  resources :people do
    resources :phones
  end
end
