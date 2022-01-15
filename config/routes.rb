Rails.application.routes.draw do
  resources :reviews, only: [:index,:create,:destroy]
  resources :tasks

end
