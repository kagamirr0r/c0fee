require 'rails_helper'

RSpec.feature 'SearchRecipes', type: :feature do
  let(:taste) { create :taste }
  before do
    log_in(taste.recipe.bean.user)
  end

  scenario 'search recipe' do
    visit recipes_path

    # hot_ice
    select taste.recipe.hot_ice, from: Recipe.human_attribute_name(:hot_ice)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.recipe.hot_ice

    # extraction
    select taste.recipe.extraction, from: Recipe.human_attribute_name(:extraction)
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.recipe.extraction

    # sour
    fill_in Taste.human_attribute_name(:t_sour), with: taste.t_sour
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_comment

    # bitter
    fill_in Taste.human_attribute_name(:t_bitter), with: taste.t_bitter
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_comment

    # sweet
    fill_in Taste.human_attribute_name(:t_sweet), with: taste.t_sweet
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_comment

    # aroma
    fill_in Taste.human_attribute_name(:t_aroma), with: taste.t_aroma
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_comment

    # fullbody
    fill_in Taste.human_attribute_name(:t_fullbody), with: taste.t_fullbody
    click_button I18n.t('recipes.search_form.submit_search')
    expect(page).to have_content taste.t_comment
  end
end
