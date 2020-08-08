require 'rails_helper'

RSpec.feature 'Beans', type: :feature do
  let(:user) { create :user }
  let(:impression) { build :impression }
  let(:another_impression) { build :another_impression }
  before do
    create(:shop)
    log_in(user)
  end

  scenario 'CRUD of bean' do
    # create

    within '.nav-wrapper' do
      click_on I18n.t('layouts.application.bean')
    end

    expect(page).to have_content I18n.t('beans.index.Did_you_brew_the_following_beans?')

    within '.fixed-action-btn' do
      click_on 'edit'
    end

    expect(page).to have_content I18n.t('shops.index.Did_you_buy_a_coffee_beans_following_shops?')

    within '.card-action' do
      click_on 'add'
    end

    select impression.bean.country_i18n
    fill_in 'bean_area', with: impression.bean.area
    fill_in 'bean_farm', with: impression.bean.farm
    select impression.bean.variety_i18n
    select impression.bean.process_i18n
    select impression.bean.roast_i18n
    fill_in 'bean_roast_date', with: impression.bean.roast_date
    fill_in 'bean_price', with: impression.bean.price
    select impression.i_sour, from: 'bean_impression_attributes_i_sour'
    select impression.i_sweet, from: 'bean_impression_attributes_i_sweet'
    select impression.i_bitter, from: 'bean_impression_attributes_i_bitter'
    fill_in 'bean_impression_attributes_i_comment', with: impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.registered_bean')

    # show
    bean = Bean.last
    visit "/ja/beans/#{bean.id}"
    expect(page).to have_content bean.country_i18n
    expect(page).to have_content bean.area
    expect(page).to have_content bean.farm
    expect(page).to have_content bean.variety_i18n
    expect(page).to have_content bean.process_i18n
    expect(page).to have_content bean.roast_i18n
    expect(page).to have_content bean.roast_date
    expect(page).to have_content bean.price
    expect(page).to have_content bean.impression.i_sour
    expect(page).to have_content bean.impression.i_sweet
    expect(page).to have_content bean.impression.i_bitter
    expect(page).to have_content bean.impression.i_comment

    # edit
    within '.card-action' do
      click_on 'edit'
    end
    select another_impression.bean.country_i18n, from: 'bean_country'
    fill_in 'bean_area', with: another_impression.bean.area
    fill_in 'bean_farm', with: another_impression.bean.farm
    select another_impression.bean.variety_i18n
    select another_impression.bean.process_i18n, from: 'bean_process'
    select another_impression.bean.roast_i18n, from: 'bean_roast'
    fill_in 'bean_roast_date', with: another_impression.bean.roast_date
    fill_in 'bean_price', with: another_impression.bean.price
    select another_impression.i_sour, from: 'bean_impression_attributes_i_sour'
    select another_impression.i_sweet, from: 'bean_impression_attributes_i_sweet'
    select another_impression.i_bitter, from: 'bean_impression_attributes_i_bitter'
    fill_in 'bean_impression_attributes_i_comment', with: another_impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.edited_bean')

    # delete
    visit "/ja/beans/#{bean.id}"
    click_on 'delete'
    expect(page).to have_content I18n.t('beans.delete_bean_link.are_you_sure?')

    click_on I18n.t('beans.delete_bean_link.delete')
    expect(page).to have_content I18n.t('beans.flash.deleted_bean')
  end
end
