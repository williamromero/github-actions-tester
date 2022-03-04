# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html  
  
  # namespace :api do
  #   namespace :v1 do
      resources :events, only: :create
      
      resources :issues, only: [:index], param: :id  do
        resources :events, only: :index
      end
  #   end
  # end
  
end
