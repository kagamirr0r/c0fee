require 'rails_helper'

RSpec.feature 'RecipeLikes', type: :feature do
  let(:impression) { create :impression }
  before do
    log_in(impression.bean.user)
    create(:taste)
  end

  scenario 'recipe_like_button' do
    visit recipes_path
    click_button 'LIKE!'
    expect(page).to have_content 'LIKED'

    visit recipes_path
    click_button 'LIKED'
    expect(page).to have_content 'LIKE!'
  end
end
