Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'homes#top'
	get 'homes/about' => 'homes#about'
	get 'admins/top' => 'admins#top'

	resources :mytrips
	resources :users

 	resources :mytrips do
  resource :favorites, only: [:create, :destroy]
  resource :comments, only: [:create, :destroy]

  end
end