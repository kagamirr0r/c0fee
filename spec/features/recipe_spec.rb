require 'rails_helper'

RSpec.feature "Recipes", type: :feature do
	let(:user) {create :user}
	let(:shop) {create :shop}
	before do
		log_in(user)
		register_shop(shop)
		register_bean
	end

	scenario"CRUD of recipe"do
		#create
		visit beans_path
		find('.create_recipe').click
		select 'ホット', from: 'recipe_hot_ice'
		select '中細挽き', from: 'recipe_grind'
		fill_in 'recipe_amount', with: 15
		select 'ペーパーフィルター'	, from: 'recipe_extraction'
		fill_in 'recipe_temperature', with: 95
		fill_in 'recipe_taste_attributes_t_sour', with: 3
		fill_in 'recipe_taste_attributes_t_sweet', with: 3
		fill_in 'recipe_taste_attributes_t_bitter', with: 3
		fill_in 'recipe_taste_attributes_t_aroma', with: 3
		fill_in 'recipe_taste_attributes_t_fullbody', with: 3
		fill_in 'recipe_taste_attributes_t_comment', with: '美味しい！'
		click_button I18n.t('recipes.form.register')
		expect(page).to have_content I18n.t('recipes.flash.created_recipe')

		#show
		recipe = Recipe.last
		visit recipe_path(recipe.id)
		expect(page).to have_content '豆量'

		#edit
		click_link I18n.t('recipes.recipe.edit')
		select 'アイス', from: 'recipe_hot_ice'
		select '細挽き', from: 'recipe_grind'
		fill_in 'recipe_amount', with: 20
		select '急冷'	, from: 'recipe_extraction'
		fill_in 'recipe_temperature', with: 90
		fill_in 'recipe_taste_attributes_t_sour', with: 2
		fill_in 'recipe_taste_attributes_t_sweet', with: 2
		fill_in 'recipe_taste_attributes_t_bitter', with: 5
		fill_in 'recipe_taste_attributes_t_aroma', with: 2
		fill_in 'recipe_taste_attributes_t_fullbody', with: 4
		fill_in 'recipe_taste_attributes_t_comment', with: '冷たい！'
		click_button I18n.t('recipes.form.register')
		expect(page).to have_content I18n.t('recipes.flash.edited_recipe')

		#delete
		find('.delete_recipe').click
		expect(page).to have_content I18n.t('recipes.flash.deleted_recipe')
	end
end
