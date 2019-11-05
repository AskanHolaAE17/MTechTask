# frozen_string_literal: true

Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  root 'imports#index'

  resources :imports

  get '/reset_the_database/:id', to: 'imports#reset_the_database'
  get '/reset_the_database', to: 'imports#reset_the_database'
end
