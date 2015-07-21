Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users
	get 'hours/projects' => 'hours#projects'
  resources :hours
	root 'home#index'
  
end