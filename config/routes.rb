Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "hello#top"
  resources :maps
  get "map/search" => "maps#search"
  get '/map/hashtag/:name', to: "maps#hashtag"
end
