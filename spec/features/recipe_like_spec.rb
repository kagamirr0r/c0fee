require 'rails_helper'

RSpec.feature 'RecipeLikes', type: :feature do
  let(:taste) { create :taste }
  before do
    log_in(taste.recipe.bean.user)
  end

  scenario 'recipe_like_button' do
    visit recipes_path
    click_button I18n.t('recipe_likes.like_recipe_button.like_recipe')
    expect(page).to have_content 'Liked'

    visit recipes_path
    click_button I18n.t('recipe_likes.like_recipe_button.cancel_like_recipe')
    expect(page).to have_content 'Like!'
  end
end
