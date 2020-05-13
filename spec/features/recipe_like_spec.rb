require 'rails_helper'

RSpec.feature 'RecipeLikes', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
    create(:taste)
  end

  scenario 'recipe_like_button' do
    visit recipes_path
    click_button 'Like!', match: :first
    expect(page).to have_content 'Liked'

    visit recipes_path
    click_button 'Liked', match: :first
    expect(page).to have_content 'Like!'
  end
end
