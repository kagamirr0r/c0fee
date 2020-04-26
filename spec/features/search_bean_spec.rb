require 'rails_helper'

RSpec.feature "SearchBeans", type: :feature do
	let(:user) { create :user }
	let(:shop) { create :shop }
	let(:bean) { build :bean }
	let(:impression) { build :impression}
  before do
    log_in(user)
    register_shop(shop)
    register_bean(bean,impression)
	end

	scenario 'search bean' do
		visit beans_path

		#country
		fill_in 'search_bean_country', with: bean.country
		click_button I18n.t('.submit_search')
		expect(page).to have_content Bean.human_attribute_name(:country)


	end


end
