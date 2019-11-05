# frozen_string_literal: true

Rails.application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  root 'imports#index'

  resources :imports

end
