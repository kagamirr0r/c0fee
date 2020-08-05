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

    within '.nav-wrapper' do
      click_on 'import_contacts'
    end

    within '.fixed-action-btn' do
      click_on 'edit'
    end

    within '.card-action' do
      click_on 'add'
    end

    select taste.recipe.hot_ice_i18n, from: 'recipe_hot_ice'
    select taste.recipe.grind_i18n, from: 'recipe_grind'
    fill_in 'recipe_amount', with: taste.recipe.amount
    select taste.recipe.extraction_i18n, from: 'recipe_extraction'
    fill_in 'recipe_extracted_amount', with: taste.recipe.extracted_amount
    fill_in 'recipe_temperature', with: taste.recipe.temperature
    select taste.t_sour, from: 'recipe_taste_attributes_t_sour'
    select taste.t_sweet, from: 'recipe_taste_attributes_t_sweet'
    select taste.t_bitter, from: 'recipe_taste_attributes_t_bitter'
    select taste.t_aroma, from: 'recipe_taste_attributes_t_aroma'
    select taste.t_fullbody, from: 'recipe_taste_attributes_t_fullbody'
    fill_in 'recipe_taste_attributes_t_comment', with: taste.t_comment
    click_button I18n.t('recipes.form.register')
    expect(page).to have_content I18n.t('recipes.flash.made_recipe')

    # show
    recipe = Recipe.last
    visit "/ja/recipes/#{recipe.id}"
    expect(page).to have_content recipe.hot_ice_i18n
    expect(page).to have_content recipe.grind_i18n
    expect(page).to have_content recipe.amount
    expect(page).to have_content recipe.extraction_i18n
    expect(page).to have_content recipe.extracted_amount
    expect(page).to have_content recipe.temperature
    expect(page).to have_content recipe.taste.t_sour
    expect(page).to have_content recipe.taste.t_sweet
    expect(page).to have_content recipe.taste.t_bitter
    expect(page).to have_content recipe.taste.t_aroma
    expect(page).to have_content recipe.taste.t_fullbody
    expect(page).to have_content recipe.taste.t_comment

    # edit
    within '.card-action' do
      click_on 'edit'
    end
    select another_taste.recipe.hot_ice_i18n, from: 'recipe_hot_ice'
    select another_taste.recipe.grind_i18n, from: 'recipe_grind'
    fill_in 'recipe_amount', with: another_taste.recipe.amount
    select another_taste.recipe.extraction_i18n, from: 'recipe_extraction'
    fill_in 'recipe_extracted_amount', with: another_taste.recipe.extracted_amount
    fill_in 'recipe_temperature', with: another_taste.recipe.temperature
    select another_taste.t_sour, from: 'recipe_taste_attributes_t_sour'
    select another_taste.t_sweet, from: 'recipe_taste_attributes_t_sweet'
    select another_taste.t_bitter, from: 'recipe_taste_attributes_t_bitter'
    select another_taste.t_aroma, from: 'recipe_taste_attributes_t_aroma'
    select another_taste.t_fullbody, from: 'recipe_taste_attributes_t_fullbody'
    fill_in 'recipe_taste_attributes_t_comment', with: another_taste.t_comment
    click_button I18n.t('recipes.form.register')
    expect(page).to have_content I18n.t('recipes.flash.edited_recipe')

    # delete
    visit "/ja/recipes/#{recipe.id}"
    click_on 'delete'
    expect(page).to have_content I18n.t('recipes.delete_recipe_link.are_you_sure?')

    click_on I18n.t('recipes.delete_recipe_link.delete')
    expect(page).to have_content I18n.t('recipes.flash.deleted_recipe')
  end
end
