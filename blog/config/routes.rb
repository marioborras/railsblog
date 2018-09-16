Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :comments
  resources :users
  
root 'sessions#login'
get '/signin' => 'sessions#new', as: :new_session
post '/create-session' => 'sessions#create', as: :create_session
get '/signout' => 'sessions#destroy', as: :destroy_session

end
