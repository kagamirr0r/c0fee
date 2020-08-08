require 'rails_helper'

RSpec.feature 'Shops', type: :feature do
  let(:user) { create :user }
  let(:shop) { build :shop }
  let(:another_shop) { build :another_shop }
  before do
    log_in(user)
  end

  scenario 'CRUD of shop wihtout delete' do
    # create

    within '.nav-wrapper' do
      click_on 'store'
    end

    within '.fixed-action-btn' do
      click_on 'edit'
    end

    fill_in 'shop_name', with: shop.name
    fill_in 'shop_address', with: shop.address
    fill_in 'shop_url', with: shop.url
    click_button I18n.t('shops.form.register')
    expect(page).to have_content I18n.t('shops.flash.registered_shop')

    # show
    shop = Shop.last
    visit "/ja/shops/#{shop.id}"
    expect(page).to have_content shop.name

    # edit
    within '#shop_info' do
      click_on 'edit'
    end
    fill_in 'shop_name', with: another_shop.name
    fill_in 'shop_address', with: another_shop.address
    fill_in 'shop_url', with: another_shop.url
    click_button I18n.t('shops.form.register')
    expect(page).to have_content I18n.t('shops.flash.edited_shop')
  end
end
