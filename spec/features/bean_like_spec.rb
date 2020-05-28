require 'rails_helper'

RSpec.feature 'BeanLikes', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
  end

  scenario 'bean_like_button',js: true do do
		visit beans_path
    click_button I18n.t('bean_likes.like_bean_button.like_bean')
    expect(page).to have_content I18n.t('bean_likes.like_bean_button.cancel_like_bean')

    visit beans_path
    click_button I18n.t('bean_likes.like_bean_button.cancel_like_bean')
    expect(page).to have_content I18n.t('bean_likes.like_bean_button.like_bean')
  end
end
