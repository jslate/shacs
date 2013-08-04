Shacs::Application.routes.draw do

  resources :events

  root to: 'activities#index'
  resources :activities
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/')
end
