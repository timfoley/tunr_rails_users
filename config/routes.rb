Rails.application.routes.draw do
  root to: 'artists#index'

  resources :songs, except: [:new, :create]
  resources :artists do
    resources :songs, only: [:new, :create]
  end
  resources :users

  get '/show_session' => 'sessions#index'

  get '/set_session' => 'sessions#set_session'
end
