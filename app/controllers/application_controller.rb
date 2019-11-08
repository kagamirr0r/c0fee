class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      my_pages_show_path
  end

  def bean_liked_counts(bean)
    @count_bean_likes = bean.bean_liked_users.count
	end

	def beans_liked_counts(beans)
		beans.reverse_each do |bean|
		 @count_beans_likes = bean.bean_liked_users.count
		end
	end

	def liked_beans_liked_counts(beans)
		beans.reverse_each do |bean|
			@count_liked_beans_likes = bean.bean_liked_users.count
		end
	end

  def recipe_liked_counts(recipe)
    @count_recipe_likes = recipe.recipe_liked_users.count
	end

	def recipes_liked_counts(recipes)
		recipes.reverse_each do |recipe|
		 @count_recipes_likes = recipe.recipe_liked_users.count
		end
	end

	def liked_recipes_liked_counts(recipes)
		recipes.reverse_each do |recipe|
			@count_liked_recipes_likes = recipe.recipe_liked_users.count
		 end
	end

	def shop_liked_counts(shop)
    @count_shop_likes = shop.shop_liked_users.count
	end

	def liked_shops_liked_counts(shops)
		shops.reverse_each do |shop|
			@count_liked_shops_likes = shop.shop_liked_users.count
		end
	end
  private
  def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
    end

end
