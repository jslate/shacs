Shacs::Application.routes.draw do

  root to: 'events#index'

  resources :events

  resources :activities do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'need_session', to: 'sessions#need', as: 'need_session'
  get 'auth/failure', to: redirect('/')
end
