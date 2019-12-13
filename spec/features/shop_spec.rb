require 'rails_helper'

RSpec.feature "Shops", type: :feature do
	let(:user) {create :user}
	before do
	 log_in(user)
	end

	scenario 'CRUD of shop wihtout delete'do
		#create
		visit root_path
		click_link I18n.t('layouts.application.register_shop')
		fill_in 'shop_name', with: 'Starbucks'
		fill_in 'shop_address', with: 'Tokyo'
		fill_in 'shop_url', with: 'https://www.starbucks.co.jp/'
		click_button I18n.t('shops.form.register')
		expect(page).to have_content I18n.t('shops.flash.registered_shop')

		#show
		shop = Shop.last
		visit shop_path(shop.id)
		expect(page).to have_content I18n.t('shops.show.registered_bean')

		#edit
		click_link I18n.t('shops.shops.edit_shop')
		fill_in 'shop_name', with: 'カルディ'
		fill_in 'shop_address', with: '大阪'
		fill_in 'shop_url', with: 'https://www.kaldi.co.jp/'
		click_button I18n.t('shops.form.register')
		expect(page).to have_content I18n.t('shops.flash.edited_shop')
	end
end
