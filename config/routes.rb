Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'top_pages#index'
  get 'my_pages/show'

  resources :users, only: [:show, :index]
  resources :shops
  resources :beans
  resources :recipes

  resources :impressions
  resources :tastes

  resources :bean_likes, only: [:create, :destroy]
	resources :recipe_likes, only: [:create, :destroy]
	resources :shop_likes, only: [:create, :destroy]
end
