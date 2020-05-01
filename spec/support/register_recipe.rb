# module RegisterRecipe
#   def register_recipe(recipe, taste)
#     visit beans_path
#     find('.create_recipe').click
#     select recipe.hot_ice, from: 'recipe_hot_ice'
#     select recipe.grind, from: 'recipe_grind'
#     fill_in 'recipe_amount', with: recipe.amount
#     select recipe.extraction, from: 'recipe_extraction'
#     fill_in 'recipe_temperature', with: recipe.temterature
#     fill_in 'recipe_taste_attributes_t_sour', with: taste.t_sour
#     fill_in 'recipe_taste_attributes_t_sweet', with: taste.t_sweet
#     fill_in 'recipe_taste_attributes_t_bitter', with: taste.t_bitter
#     fill_in 'recipe_taste_attributes_t_aroma', with: taste.t_aroma
#     fill_in 'recipe_taste_attributes_t_fullbody', with: taste.t_fullbody
#     fill_in 'recipe_taste_attributes_t_comment', with: taste.t_comment
#     click_button I18n.t('recipes.form.register')
#     expect(page).to have_content I18n.t('recipes.flash.created_recipe')
#   end
# end

# RSpec.configure do |config|
#   config.include RegisterRecipe
# end
