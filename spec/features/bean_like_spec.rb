require 'rails_helper'

RSpec.feature 'BeanLikes', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
  end

  scenario 'bean_like_button' do
    visit beans_path
    click_button 'Like!'
    expect(page).to have_content 'Liked'

    visit beans_path
    click_button 'Liked'
    expect(page).to have_content 'Like!'
  end
end
