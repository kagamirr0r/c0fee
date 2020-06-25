Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations',
                                    sessions: 'sessions' }
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    devise_scope :user do
      post 'users/guest_sign_in', to: 'sessions#new_guest'
    end

    root 'top_pages#index'

    get 'inquiry', to: 'inquiry#index'
    get 'inquiry/confirm' => redirect("/inquiry")
    post 'inquiry/confirm' => 'inquiry#confirm'

    resources :my_pages, only: [:show]

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
end
