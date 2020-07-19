require 'rails_helper'

RSpec.feature 'SearchBeans', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
  end

  scenario 'search bean' do
    visit root_path

    within '.nav-wrapper' do
      click_link I18n.t('layouts.application.bean')
    end

    # country
    select impression.bean.country_i18n, from: Bean.human_attribute_name(:country)
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.bean.country_i18n

    # roast
    select impression.bean.roast_i18n, from: Bean.human_attribute_name(:roast)
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.bean.roast_i18n

    # sour
    select impression.i_sour, from: Impression.human_attribute_name(:i_sour)
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.i_sour

    # sweet
    select impression.i_sweet, from: Impression.human_attribute_name(:i_sweet)
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.i_sweet

    # bitter
    select impression.i_bitter, from: Impression.human_attribute_name(:i_bitter)
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.i_bitter
  end
end
