require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { build(:shop) }

  describe 'validation' do
    describe 'presence' do
      it 'is invalid without a name' do
        shop.name = ''
        expect(shop.valid?).to eq(false)
      end

      it 'is invalid without a url' do
        shop.url = ''
        expect(shop.valid?).to eq(false)
      end
    end

    describe 'uniqueness' do
      it 'ununique url is invalid' do
        shop1 = Shop.create(
          name: 'coffeeshop1',
          address: 'Tokyo',
          url: 'shopexmple.com'
        )

        shop2 = Shop.new(
          name: 'coffeeshop2',
          address: 'Sendai',
          url: 'shopexmple.com'
        )
        expect(shop2.valid?).to eq(false)
      end
    end

    it 'is invalid if url protocol is not normal' do
      shop.url = 'www//https.google.com'
      expect(shop.valid?).to eq(false)
    end
  end
end
