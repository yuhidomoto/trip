Rails.application.routes.draw do

  # user #
  # devise
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  namespace :users do
    resources :inquiries, only:[:new, :create]
  end

  # 機能
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'seemore' => 'mytrips#seemore'
  resources :mytrips do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
    collection do
      get 'search' => 'searchs#search'
    end
  end

#----------------------------------------------

# admin #

# devise
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations',
  passwords: 'admins/passwords'
}
# 機能 #
  namespace :admins do
    resources :users, only: [:index,:show,:edit,:update,:destroy]
    resources :mytrips, only: [:index,:show,:edit,:update,:destroy]
    resources :inquiries, only:[:index,:update, :show, :destroy]
    get 'top' => 'homes#top'
    get 'seemore' => 'mytrips#seemore'
  end
end