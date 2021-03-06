Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search', to: 'searchs#search'
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update] do
      resource :relationships, only: [:index, :create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
  end


  resources :books, only: [:new, :create, :index, :show, :update, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]

  resources :book_comments, only: [:create, :destroy]
  end


end