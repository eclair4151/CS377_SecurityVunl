Rails.application.routes.draw do

  match '/create_account', to: 'create_account#index' , :via => 'get'
  match '/create_account', to: 'create_account#create' , :via => 'post'

  match '/bank_transfer', to: 'bank_transfer#index' , :via => 'get'
  match '/bank_transfer', to: 'bank_transfer#create' , :via => 'post'

  match '/logout', to: 'logout#index' , :via => 'get'

  match '/profile', to: 'profile#index' , :via => 'get'
  match '/profile', to: 'profile#create' , :via => 'post'

  match '/banks', to: 'banks#index' , :via => 'get'
  match '/banks', to: 'banks#create' , :via => 'post'
  match '/banks/:id', to: 'banks#destroy' , :via => 'delete'

  match '/history', to: 'history#index' , :via => 'get'

  match '/requests', to: 'requests#index' , :via => 'get'
  match '/requests', to: 'requests#create' , :via => 'post'

  match '/make_transfer', to: 'make_transfer#index' , :via => 'get'

  match '/transfer', to: 'transfer#index' , :via => 'get'
  match '/transfer', to: 'transfer#create' , :via => 'post'

  match '/login', to: 'login#index' , :via => 'get'
  match '/login', to: 'login#create' , :via => 'post'

  root 'home#index'
end
