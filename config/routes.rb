Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
 get 'signup', to: 'users#new'
 
  root to: 'tasks#index'
  
  get 'login',to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
 
 resources :tasks
 resources :users, only: [:new,:create]
end
