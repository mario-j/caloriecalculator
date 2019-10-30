Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/home', to: 'application#index'  
  get '/', to: 'application#index' 
  
end
