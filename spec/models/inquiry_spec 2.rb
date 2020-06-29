require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) { build(:inquiry) }

  describe 'validation' do
    it 'is invalid without a name' do
      inquiry.name = ''
      expect(inquiry.valid?).to eq(false)
    end

    it 'is invalid without a email' do
      inquiry.email = ''
      expect(inquiry.valid?).to eq(false)
    end

    it 'is invalid except for normal email address format' do
      inquiry.email = 'aa.com@bbb'
      expect(inquiry.valid?).to eq(false)
    end

    it 'is invalid without a message' do
      inquiry.message = ''
      expect(inquiry.valid?).to eq(false)
    end

    it 'is invalid message is not 10 to 100 characters' do
      inquiry.message = 'a' * 9
      expect(inquiry.valid?).to eq(false)

      inquiry.message = 'a' * 301
      expect(inquiry.valid?).to eq(false)
    end
  end
end
