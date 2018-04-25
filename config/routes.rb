Rails.application.routes.draw do
	#resources :users do
		#member do
		  #get :following, :followers
		#end
	#end
	
	resources :relationships, only: [:create, :destroy]

	resources :posts

	root 'pages#index'
	
  	get '/home' => 'pages#home'

  	get '/user/:id' => 'pages#porfile'

  	get '/explore' => 'pages#explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
