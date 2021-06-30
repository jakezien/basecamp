Rails.application.routes.draw do
  resources :messages
  resources :topics
  resources :stickies

  root 'imbox#index'

  get "/set_aside", to: "set_aside#index"
  patch "/topics/bulk_update", to: "topics#bulk_update"

  resources :topics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
