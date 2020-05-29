require 'rails_helper'

RSpec.feature 'ShopLikes', type: :feature do
  let(:user) { create :user }

  before do
    create(:shop)
    log_in(user)
  end

  scenario 'shop_like_button' do
    visit shops_path
    click_button I18n.t('shop_likes.like_shop_button.like_shop')
    expect(page).to have_content "Liked"

    visit shops_path
    click_button I18n.t('shop_likes.like_shop_button.cancel_like_shop')
    expect(page).to have_content "Like!"
  end
end
