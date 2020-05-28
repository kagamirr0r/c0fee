module ApplicationHelper
  def bean_liked_counts(bean)
    @count_bean_likes = bean.bean_liked_users.count
  end

  def recipe_liked_counts(recipe)
    @count_recipe_likes = recipe.recipe_liked_users.count
  end

  def shop_liked_counts(shop)
    @count_shop_likes = shop.shop_liked_users.count
  end
end
