require 'rails_helper'

RSpec.feature "RecipeLikes", type: :feature do
	let(:user) {create :user}
	let(:shop) {build :shop}
	before do
		log_in(user)
		register_shop(shop)
		register_bean
		register_recipe
	end

	scenario"recipe_like_button" do
		visit recipes_path
		click_button 'Like!'
		expect(page).to have_content I18n.t('recipe_likes.flash.liked_recipe')

		visit recipes_path
		click_button 'Liked'
		expect(page).to have_content I18n.t('recipe_likes.flash.canceled_recipe_like')
	end
end
