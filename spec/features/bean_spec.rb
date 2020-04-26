require 'rails_helper'

RSpec.feature 'Beans', type: :feature do
  let(:user) { create :user }
	let(:shop) { create :shop }
	let(:bean) { build :bean }
	let(:impression) { build :impression }
	let(:anoter_bean) { build :anoter_bean}
	let(:anoter_impression) { build :anoter_impression}
  before do
    log_in(user)
    register_shop(shop)
  end

  scenario 'CRUD of bean' do
    # create
    visit shops_path
    find('.register_bean').click
    fill_in 'bean_country', with: bean.country
    fill_in 'bean_area', with: bean.area
    fill_in 'bean_farm', with: bean.farm
    fill_in 'bean_variety', with: bean.variety
    select bean.process, from: 'bean_process'
    select bean.roast, from: 'bean_roast'
    fill_in 'bean_price', with: bean.price
    fill_in 'bean_bean_url', with: bean.bean_url
    fill_in 'bean_impression_attributes_i_sour', with: impression.i_sour
    fill_in 'bean_impression_attributes_i_sweet', with: impression.i_sweet
    fill_in 'bean_impression_attributes_i_bitter', with: impression.i_bitter
    fill_in 'bean_impression_attributes_i_comment', with: impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.registered_bean')

    # show
    bean = Bean.last
    visit bean_path(bean.id)
    expect(page).to have_content Bean.human_attribute_name(:farm)

    # edit
		click_link I18n.t('beans.bean.edit')
    fill_in 'bean_country', with: another_bean.country
    fill_in 'bean_area', with: another_bean.area
    fill_in 'bean_farm', with: another_bean.farm
    fill_in 'bean_variety', with: another_bean.variety
    select another_bean.process, from: 'bean_process'
    select another_bean.roast, from: 'bean_roast'
    fill_in 'bean_price', with: another_bean.price
    fill_in 'bean_bean_url', with: another_bean.bean_url
    fill_in 'bean_impression_attributes_i_sour', with: another_impression.i_sour
    fill_in 'bean_impression_attributes_i_sweet', with: another_impression.i_sweet
    fill_in 'bean_impression_attributes_i_bitter', with: another_impression.i_bitter
    fill_in 'bean_impression_attributes_i_comment', with: another_impression.i_comment
    click_button I18n.t('beans.form.register')
    # find('.register_bean').click
    expect(page).to have_content I18n.t('beans.flash.edited_bean')

    # delete
    find('.delete_bean').click
    expect(page).to have_content I18n.t('beans.flash.deleted_bean')
  end
end
