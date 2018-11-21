Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'words#index'
  resources :words
  resources :games, only: %i[new create show]
  resources :answers, only: %i[create]
end
