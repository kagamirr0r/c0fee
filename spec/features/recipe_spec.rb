require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  let(:user) { create :user }
	let(:recipe) { build :recipe }
	let(:taste) { build :taste }
	let(:another_recipe) { build :another_recipe }
	let(:another_taste) { build :another_taste }
	before do
		create(:impression)
		log_in(user)
  end

  scenario 'CRUD of recipe' do
    # create
    visit beans_path
    find('.create_recipe').click
    select recipe.hot_ice, from: 'recipe_hot_ice'
    select recipe.grind, from: 'recipe_grind'
    fill_in 'recipe_amount', with: recipe.amount
    select recipe.extraction, from: 'recipe_extraction'
    fill_in 'recipe_temperature', with: recipe.temperature
    fill_in 'recipe_taste_attributes_t_sour', with: taste.t_sour
    fill_in 'recipe_taste_attributes_t_sweet', with: taste.t_sweet
    fill_in 'recipe_taste_attributes_t_bitter', with: taste.t_bitter
    fill_in 'recipe_taste_attributes_t_aroma', with: taste.t_aroma
    fill_in 'recipe_taste_attributes_t_fullbody', with: taste.t_fullbody
    fill_in 'recipe_taste_attributes_t_comment', with: taste.t_comment
    click_button I18n.t('recipes.form.register')
    expect(page).to have_content I18n.t('recipes.flash.created_recipe')

    # show
    recipe = Recipe.last
    visit recipe_path(recipe.id)
    expect(page).to have_content Recipe.human_attribute_name(:amount)

    # edit
    click_link I18n.t('recipes.recipe.edit')
    select another_recipe.hot_ice, from: 'recipe_hot_ice'
    select another_recipe.grind, from: 'recipe_grind'
    fill_in 'recipe_amount', with: another_recipe.amount
    select another_recipe.extraction, from: 'recipe_extraction'
    fill_in 'recipe_temperature', with: another_recipe.temperature
    fill_in 'recipe_taste_attributes_t_sour', with: another_taste.t_sour
    fill_in 'recipe_taste_attributes_t_sweet', with: another_taste.t_sweet
    fill_in 'recipe_taste_attributes_t_bitter', with: another_taste.t_bitter
    fill_in 'recipe_taste_attributes_t_aroma', with: another_taste.t_aroma
    fill_in 'recipe_taste_attributes_t_fullbody', with: another_taste.t_fullbody
    fill_in 'recipe_taste_attributes_t_comment', with: another_taste.t_comment
    click_button I18n.t('recipes.form.register')
    expect(page).to have_content I18n.t('recipes.flash.edited_recipe')

    # delete
    click_link I18n.t('recipes.recipes.delete')
    expect(page).to have_content I18n.t('recipes.flash.deleted_recipe')
  end
end
