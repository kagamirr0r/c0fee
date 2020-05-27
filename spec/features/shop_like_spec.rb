require 'rails_helper'

RSpec.feature 'ShopLikes', type: :feature do
  let(:user) { create :user }

  before do
    create(:shop)
    log_in(user)
  end

  scenario 'shop_like_button' do
    visit shops_path
    click_button 'LIKE!'
    expect(page).to have_content 'LIKED'

    visit shops_path
    click_button 'LIKED'
    expect(page).to have_content 'LIKE!'
  end
end
