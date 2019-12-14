require 'rails_helper'

RSpec.describe Recipe, type: :model do
	let(:recipe) {build(:recipe)}

	describe "validation" do
		it"is invalid without a bean hot_ice" do
		  recipe.hot_ice = ""
			expect(recipe.valid?).to eq(false)
		end

		it"amount must not be over 100" do
			recipe.amount = 1001
			expect(recipe.valid?).to eq(false)
		end

	end
end
