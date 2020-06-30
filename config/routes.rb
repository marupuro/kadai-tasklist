Rails.application.routes.draw do
  get 'toppages/index'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'usrs/index'
  get 'usrs/show'
  get 'usrs/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
 get 'signup', to: 'users#new'
 
  root to: 'toppages#index'
 
 resources :tasks
 resources :users, only: [:index, :new, :show,:create]
end
