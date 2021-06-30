Rails.application.routes.draw do
  resources :messages
  resources :topics
  resources :stickies

  root 'imbox#index'

  get "/set_aside", to: "set_aside#index"
  post "/topics/bulk_update", to: "topics#bulk_update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
