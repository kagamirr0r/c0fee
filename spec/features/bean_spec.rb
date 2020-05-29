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
    visit shops_path
    click_link I18n.t('shops.shops.register_bean')
    fill_in 'bean_country', with: impression.bean.country
    fill_in 'bean_area', with: impression.bean.area
    fill_in 'bean_farm', with: impression.bean.farm
    fill_in 'bean_variety', with: impression.bean.variety
    select impression.bean.process_i18n, from: 'bean_process'
    select impression.bean.roast_i18n, from: 'bean_roast'
    fill_in 'bean_price', with: impression.bean.price
    fill_in 'bean_bean_url', with: impression.bean.bean_url
    fill_in 'bean_impression_attributes_i_sour', with: impression.i_sour
    fill_in 'bean_impression_attributes_i_sweet', with: impression.i_sweet
    fill_in 'bean_impression_attributes_i_bitter', with: impression.i_bitter
    fill_in 'bean_impression_attributes_i_comment', with: impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.registered_bean')

    # show
    bean = Bean.last
    visit "/ja/beans/#{bean.id}"
    expect(page).to have_content Bean.human_attribute_name(:farm)

    # edit
    click_link I18n.t('beans.bean.edit')
    fill_in 'bean_country', with: another_impression.bean.country
    fill_in 'bean_area', with: another_impression.bean.area
    fill_in 'bean_farm', with: another_impression.bean.farm
    fill_in 'bean_variety', with: another_impression.bean.variety
    select another_impression.bean.process_i18n, from: 'bean_process'
    select another_impression.bean.roast_i18n, from: 'bean_roast'
    fill_in 'bean_price', with: another_impression.bean.price
    fill_in 'bean_bean_url', with: another_impression.bean.bean_url
    fill_in 'bean_impression_attributes_i_sour', with: another_impression.i_sour
    fill_in 'bean_impression_attributes_i_sweet', with: another_impression.i_sweet
    fill_in 'bean_impression_attributes_i_bitter', with: another_impression.i_bitter
    fill_in 'bean_impression_attributes_i_comment', with: another_impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.edited_bean')

    # delete
    click_link I18n.t('beans.beans.delete')
		expect(page).to have_content I18n.t('beans.flash.deleted_bean')
	end
end
