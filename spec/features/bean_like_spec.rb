require 'rails_helper'

RSpec.feature 'BeanLikes', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
  end

  scenario 'bean_like_button' do
    visit beans_path
    click_button 'LIKE!'
    expect(page).to have_content 'LIKED'

    visit beans_path
    click_button 'LIKED'
    expect(page).to have_content 'LIKE!'
  end
end
