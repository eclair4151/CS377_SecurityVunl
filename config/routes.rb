Rails.application.routes.draw do

  match '/profile', to: 'profile#index' , :via => 'get'
  match '/profile', to: 'profile#create' , :via => 'post'

  match '/banks', to: 'banks#index' , :via => 'get'
  match '/banks', to: 'banks#create' , :via => 'post'

  match '/history', to: 'history#index' , :via => 'get'

  match '/request', to: 'request#index' , :via => 'get'
  match '/request', to: 'request#create' , :via => 'post'

  match '/make_transfer', to: 'make_transfer#index' , :via => 'get'

  match '/transfer', to: 'transfer#index' , :via => 'get'
  match '/transfer', to: 'transfer#create' , :via => 'post'
  match '/login', to: 'login#index' , :via => 'get'
  match '/login', to: 'login#create' , :via => 'post'

  root 'home#index'
end
