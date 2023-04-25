Rails.application.routes.draw do
  resources :artworks
  root 'artworld#welcome'
end
