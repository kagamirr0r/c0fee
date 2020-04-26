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
		fill_in Bean.human_attribute_name(:country),
	end

end
