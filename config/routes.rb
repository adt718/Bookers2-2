Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]do
   resource :relationships, only: [:index,:create,:destroy]
    get 'followings' => 'users#followings', as: 'followings'
    get 'followers' => 'users#followers', as: 'followers'
  end

  get '/search', to: 'search#search'

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
end
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get 'favorites/index'
end
