require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validation' do
    it 'is invalid without an email address' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end
  end
end
