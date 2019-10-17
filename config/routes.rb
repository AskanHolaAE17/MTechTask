Rails.application.routes.draw do

  root 'imports#index'
  
  resources :imports
  
end
