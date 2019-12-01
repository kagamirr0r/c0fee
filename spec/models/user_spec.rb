require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe "validation" do
    it"is invalid without an email address" do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end
