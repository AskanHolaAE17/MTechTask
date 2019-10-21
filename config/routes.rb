# frozen_string_literal: true

Rails.application.routes.draw do
  root 'imports#index'

  resources :imports

  get '/import_process/:id', to: 'imports#import_process'
end
