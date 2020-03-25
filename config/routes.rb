Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
    resources :users, only: [:index,:show,:edit,:update,:destroy]
    resources :mytrips, only: [:index,:show,:edit,:update,:destroy]
    get 'top' => 'homes#top'
    get 'seemore' => 'mytrips#seemore'
  end

	root 'homes#top'
	get 'homes/about' => 'homes#about'
  get 'seemore' => 'mytrips#seemore'

	resources :users

  resources :mytrips do
  resource :favorites, only: [:create, :destroy]
  resource :comments, only: [:create, :destroy]
  collection do
    get 'search' => 'searchs#search'
  end
  end
end