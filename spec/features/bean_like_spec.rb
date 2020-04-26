require 'rails_helper'

RSpec.feature 'BeanLikes', type: :feature do
  let(:user) { create :user }
	let(:shop) { create :shop }
	let(:bean) { build :bean }
	let(:impression) { build :impression }
  before do
    log_in(user)
    register_shop(shop)
    register_bean(bean,impression)
  end

  scenario 'bean_like_button' do
    visit beans_path
    click_button 'Like!'
    expect(page).to have_content I18n.t('bean_likes.flash.liked_bean')

    visit beans_path
    click_button 'Liked'
    expect(page).to have_content I18n.t('bean_likes.flash.canceled_like_bean')
  end
end
