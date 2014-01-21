require "sidekiq/web"
require 'sidetiq/web'

Me2meDos::Application.routes.draw do

  root :to => "users#index"
  post "/messages/search" => "messages#search"
  post "/messages/tag" => "messages#tag"
  get "/letters/archived" => "letters#archived"
  get "/logout" => "sessions#destroy"
  get "/users/current" => "users#current"
  mount Sidekiq::Web, at: "/sidekiq"

  resources :users
  resources :sessions
  resources :messages
  resources :letters

  match "/*missing_route" => "users#not_found"
end
