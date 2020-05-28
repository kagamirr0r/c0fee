require 'rails_helper'

RSpec.feature 'RecipeLikes', type: :feature do
  let(:taste) { create :taste }
  before do
    log_in(taste.recipe.bean.user)
  end

  scenario 'recipe_like_button', js: true do
    visit recipes_path
    click_button I18n.t('recipe_likes.like_recipe_button.like_recipe')
    expect(page).to have_content I18n.t('recipe_likes.like_recipe_button.cancel_like_recipe')

    visit recipes_path
    click_button I18n.t('recipe_likes.like_recipe_button.cancel_like_recipe')
    expect(page).to have_content I18n.t('recipe_likes.like_recipe_button.like_recipe')
  end
end
