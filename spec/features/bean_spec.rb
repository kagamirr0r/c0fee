require 'rails_helper'

RSpec.feature 'Beans', type: :feature do
  let(:user) { create :user }
  let(:shop) { create :shop }
  before do
    log_in(user)
    register_shop(shop)
  end

  scenario 'CRUD of bean' do
    # create
    visit shops_path
    find('.register_bean').click
    fill_in 'bean_country', with: 'ブラジル'
    fill_in 'bean_area', with: 'ミナスジェライス'
    fill_in 'bean_farm', with: 'サンタカタリーナ'
    fill_in 'bean_variety', with: 'カツアイ'
    select 'ナチュラル', from: 'bean_process'
    select 'シティ', from: 'bean_roast'
    fill_in 'bean_price', with: 800
    fill_in 'bean_bean_url', with: 'http://greenbeans.jp/?pid=56382011'
    fill_in 'bean_impression_attributes_i_sour', with: 3
    fill_in 'bean_impression_attributes_i_sweet', with: 3
    fill_in 'bean_impression_attributes_i_bitter', with: 3
    fill_in 'bean_impression_attributes_i_comment', with: '美味しい！'
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.registered_bean')

    # show
    bean = Bean.last
    visit bean_path(bean.id)
    expect(page).to have_content '農園'

    # edit
    click_link I18n.t('beans.bean.edit')
    fill_in 'bean_country', with: 'エチオピア'
    fill_in 'bean_area', with: 'イルガチェフェ'
    fill_in 'bean_farm', with: 'パナマエメラルド'
    fill_in 'bean_variety', with: 'ゲイシャ'
    select 'ウォッシュド', from: 'bean_process'
    select 'フルシティ', from: 'bean_roast'
    fill_in 'bean_price', with: 2000
    fill_in 'bean_bean_url', with: 'https://sanwacoffeeworks.com/ethiopia-yirgacheffe/'
    fill_in 'bean_impression_attributes_i_sour', with: 5
    fill_in 'bean_impression_attributes_i_sweet', with: 5
    fill_in 'bean_impression_attributes_i_bitter', with: 3
    fill_in 'bean_impression_attributes_i_comment', with: '素晴らしい！'
    expect(page).to have_content '甘味'
    click_button I18n.t('beans.form.register')
    # find('.register_bean').click
    expect(page).to have_content I18n.t('beans.flash.edited_bean')

    # delete
    find('.delete_bean').click
    expect(page).to have_content I18n.t('beans.flash.deleted_bean')
  end
end
