require 'rails_helper'

RSpec.describe Bean, type: :model do
  let(:bean) { build(:bean) }

  describe 'validation' do
    it 'is invalid without a country' do
      bean.country = ''
      expect(bean.valid?).to eq(false)
    end

    it 'is invalid over 30characters of area' do
      bean.area = 'a' * 31
      expect(bean.valid?).to eq(false)
    end

    it 'is invalid over 30characters of farm' do
      bean.farm = 'a' * 31
      expect(bean.valid?).to eq(false)
    end

    it 'is invalid over 10000 of price' do
      bean.price = 10_001
      expect(bean.valid?).to eq(false)
    end
  end
end
