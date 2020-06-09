module RecipesHelper
	def from_roast_date(recipe)
		if recipe.bean.roast_date?
			date = recipe.created_at.to_date - recipe.bean.roast_date
			date.to_i.abs
		end
	end
end
