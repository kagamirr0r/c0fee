require 'rails_helper'

RSpec.feature 'SearchRecipes', type: :feature do
  let(:taste) { create :taste }
  before do
    log_in(taste.recipe.bean.user)
  end

  scenario 'search recipe' do
    visit recipes_path

    # hot_ice
    select taste.recipe.hot_ice_i18n, from: Recipe.human_attribute_name(:hot_ice)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.recipe.hot_ice_i18n

    # extraction
    select taste.recipe.extraction_i18n, from: Recipe.human_attribute_name(:extraction)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.recipe.extraction_i18n

    # sour
    select taste.t_sour, from: Taste.human_attribute_name(:t_sour)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_sour

    # bitter
    select taste.t_bitter, from: Taste.human_attribute_name(:t_bitter)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_bitter

    # sweet
    select taste.t_sweet, from: Taste.human_attribute_name(:t_sweet)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_sweet

    # aroma
    select taste.t_aroma, from: Taste.human_attribute_name(:t_aroma)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_aroma

    # fullbody
    select taste.t_fullbody, from: Taste.human_attribute_name(:t_fullbody)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_fullbody
  end
end
