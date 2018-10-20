Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'words#index'
  resources :words, only: %i[index new create show]
end
