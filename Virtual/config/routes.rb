Rails.application.routes.draw do

  resources :teachers
  root 'sessions#home'
  get '/signup' => 'user#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' =>  'sessions#fbcreate'

  resources :users

  resources :students

  resources :teachers do
    resources :students, only: [:new, :create, :index]
    resources :appointments, only: [:new, :create, :index]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
