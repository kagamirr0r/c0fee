require 'rails_helper'

RSpec.describe Bean, type: :model do
 before do
	@bean = build(:bean)
 end

 describe "validation" do
	 it"is invalid without a country" do
		@bean.country = ''
		expect(@bean.valid?).to eq(false)
	 end
 end
end
