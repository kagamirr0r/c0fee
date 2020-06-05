require 'rails_helper'

RSpec.feature 'Recipes', type: :feature do
  let(:user) { create :user }
  let(:taste) { build :taste }
  let(:another_taste) { build :another_taste }
  before do
    create(:impression)
    log_in(user)
  end

  scenario 'CRUD of recipe' do
    # create
    click_on I18n.t('layouts.application.recipe')
		click_on 'import_contacts'
		click_on 'import_contacts'
    select taste.recipe.hot_ice_i18n, from: 'recipe_hot_ice'
    select taste.recipe.grind_i18n, from: 'recipe_grind'
    fill_in 'recipe_amount', with: taste.recipe.amount
    select taste.recipe.extraction_i18n, from: 'recipe_extraction'
    fill_in 'recipe_temperature', with: taste.recipe.temperature
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
    visit "/ja/recipes/#{recipe.id}"
    expect(page).to have_content recipe.temperature

    # edit
    click_on 'edit'
    select another_taste.recipe.hot_ice_i18n, from: 'recipe_hot_ice'
    select another_taste.recipe.grind_i18n, from: 'recipe_grind'
    fill_in 'recipe_amount', with: another_taste.recipe.amount
    select another_taste.recipe.extraction_i18n, from: 'recipe_extraction'
    fill_in 'recipe_temperature', with: another_taste.recipe.temperature
    fill_in 'recipe_taste_attributes_t_sour', with: another_taste.t_sour
    fill_in 'recipe_taste_attributes_t_sweet', with: another_taste.t_sweet
    fill_in 'recipe_taste_attributes_t_bitter', with: another_taste.t_bitter
    fill_in 'recipe_taste_attributes_t_aroma', with: another_taste.t_aroma
    fill_in 'recipe_taste_attributes_t_fullbody', with: another_taste.t_fullbody
    fill_in 'recipe_taste_attributes_t_comment', with: another_taste.t_comment
    click_button I18n.t('recipes.form.register')
    expect(page).to have_content I18n.t('recipes.flash.edited_recipe')

    # delete
    click_on 'delete'
    expect(page).to have_content I18n.t('recipes.flash.deleted_recipe')
  end
end
