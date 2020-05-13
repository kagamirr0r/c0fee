require 'rails_helper'

RSpec.feature 'ShopLikes', type: :feature do
  let(:user) { create :user }

  before do
    create(:shop)
    log_in(user)
  end

  scenario 'shop_like_button' do
    visit shops_path
    click_button 'Like!', match: :first
    expect(page).to have_content 'Liked'

    visit shops_path
    click_button 'Liked', match: :first
    expect(page).to have_content 'Like!'
  end
end
