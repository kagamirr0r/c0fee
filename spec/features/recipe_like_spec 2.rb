require 'rails_helper'

RSpec.feature 'RecipeLikes', type: :feature do
  let(:taste) { create :taste }
  before do
    log_in(taste.recipe.bean.user)
  end

  scenario 'recipe_like_button' do
    visit recipes_path
    click_on 'favorite_border'
    expect(page).to have_content 'favorite'

    visit recipes_path
    click_on 'favorite'
    expect(page).to have_content 'favorite_border'
  end
end
