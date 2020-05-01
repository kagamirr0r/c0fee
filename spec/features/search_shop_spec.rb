require 'rails_helper'

RSpec.feature 'SearchShops', type: :feature do
  let(:shop) { create :shop }
  let(:user) { create :user }
  before do
    log_in(user)
  end

  scenario 'search shop' do
    visit shops_path
    # name
    fill_in Shop.human_attribute_name(:name), with: shop.name
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content shop.name

    # address
    fill_in Shop.human_attribute_name(:address), with: shop.address
    click_button I18n.t('shops.search_form.submit_search')
    expect(page).to have_content shop.address
  end
end
