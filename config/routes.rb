Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to:'users#new'
  post '/signup',  to: 'users#create'

  get '/edit', to:'users#edit'
  patch '/edit',  to: 'users#update'

  resources :users, only: [:new, :create, :edit, :update]
end
