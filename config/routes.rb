Me2meDos::Application.routes.draw do

  root :to => "users#index"
  post "/messages/search" => "messages#search"
  post "/messages/tag" => "messages#tag"
  get "/logout" => "sessions#destroy"
  get "/users/current" => "users#current"
  resources :users
  resources :sessions
  resources :messages


end
