Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks",
                                    :sessions => 'sessions' }
  root 'top_pages#index'
  get 'my_pages/show'

  resources :users, only: [:show, :index]

  resources :beans
  resources :bean_likes, only: [:create, :destroy]

  resources :recipes
  resources :recipe_likes, only: [:create, :destroy]

  resources :shops
  resources :shop_likes, only: [:create, :destroy]

  resources :impressions
  resources :tastes
end
