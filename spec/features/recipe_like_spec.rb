require 'rails_helper'

RSpec.feature 'RecipeLikes', type: :feature do
	let(:impression) { create :impression }
  before do
		log_in(impression.bean.user)
		create(:taste)
  end

  scenario 'recipe_like_button' do
    visit recipes_path
    click_button 'Like!'
    expect(page).to have_content I18n.t('recipe_likes.flash.liked_recipe')

    visit recipes_path
    click_button 'Liked'
    expect(page).to have_content I18n.t('recipe_likes.flash.canceled_recipe_like')
  end
end
