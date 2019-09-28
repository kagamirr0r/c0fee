Rails.application.routes.draw do
	devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'top_pages#index'

	get 'bean_likes/create'
  get 'bean_likes/destroy'
  get 'recipe_likes/create'
	get 'recipe_likes/destroy'
	get 'users/show'

	resources :beans
	resources :recipes
	resources :impressions
	resources :tastes
	resources :shops
end
