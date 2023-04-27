Rails.application.routes.draw do
  resources :artworks
  # root 'artworld#welcome'
  resources :subscribers, only: [:create]
  root 'subscribers#index'
end
