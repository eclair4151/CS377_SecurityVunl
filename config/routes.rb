Rails.application.routes.draw do

  #get 'login/index'
  #get 'login/create'
  get 'home/index'
  match '/login', to: 'login#index' , :via => 'get'
  match '/login', to: 'login#create' , :via => 'post'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
