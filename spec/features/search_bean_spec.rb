require 'rails_helper'

RSpec.feature 'SearchBeans', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
  end

  scenario 'search bean' do
    visit root_path
    click_link I18n.t('layouts.application.bean')

    # country
    fill_in Bean.human_attribute_name(:country), with: impression.bean.country
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.bean.country

    # roast
    select impression.bean.roast_i18n, from: Bean.human_attribute_name(:roast)
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.bean.roast_i18n

    # sour
    fill_in Impression.human_attribute_name(:i_sour), with: impression.i_sour
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.i_sour

    # sweet
    fill_in Impression.human_attribute_name(:i_sweet), with: impression.i_sweet
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.i_sweet

    # bitter
    fill_in Impression.human_attribute_name(:i_bitter), with: impression.i_bitter
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content impression.i_bitter
  end
end
