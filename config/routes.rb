# frozen_string_literal: true

Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  root 'imports#index'

  resources :imports

  get '/import_process/:id', to: 'imports#import_process'
end
