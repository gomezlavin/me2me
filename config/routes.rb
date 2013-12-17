require "sidekiq/web"
require 'sidetiq/web'

Me2meDos::Application.routes.draw do

  root :to => "users#index"
  post "/messages/search" => "messages#search"
  post "/messages/tag" => "messages#tag"
  get "/logout" => "sessions#destroy"
  get "/users/current" => "users#current"
  mount Sidekiq::Web, at: "/sidekiq"

  resources :users
  resources :sessions
  resources :messages

end
