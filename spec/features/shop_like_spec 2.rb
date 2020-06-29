require 'rails_helper'

RSpec.feature 'ShopLikes', type: :feature do
  let(:user) { create :user }

  before do
    create(:shop)
    log_in(user)
  end

  scenario 'shop_like_button' do
    visit shops_path
    click_on 'favorite_border'
    expect(page).to have_content 'favorite'

    visit shops_path
    click_on 'favorite'
    expect(page).to have_content 'favorite_border'
  end
end
