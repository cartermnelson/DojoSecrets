Rails.application.routes.draw do
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get 'users/:id' => 'users#show'

  get 'sessions/new'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  get 'secrets' => 'secrets#index'
  post 'secrets' => 'secrets#create'
  delete 'secrets/:id' => 'secrets#destroy'

  post 'secrets/:secret_id/likes' => 'likes#create'
  delete 'secrets/:secret_id/likes/:id' => 'likes#destroy'
end
