Rails.application.routes.draw do
  resources :messages
  root 'imbox#index'

  resources :topics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
