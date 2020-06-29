require 'rails_helper'

RSpec.describe Taste, type: :model do
  let(:taste) { build(:taste) }

  describe 'validation' do
    describe 'presence' do
      it 'is invalid without t_sour' do
        taste.t_sour = ''
        expect(taste.valid?).to eq(false)
      end

      it 'is invalid without t_sweet' do
        taste.t_sweet = ''
        expect(taste.valid?).to eq(false)
      end

      it 'is invalid without t_bitter' do
        taste.t_bitter = ''
        expect(taste.valid?).to eq(false)
      end

      it 'is invalid without t_aroma' do
        taste.t_aroma = ''
        expect(taste.valid?).to eq(false)
      end

      it 'is invalid without t_fullbody' do
        taste.t_fullbody = ''
        expect(taste.valid?).to eq(false)
      end
    end

    describe 'length' do
      context 't_comment' do
        it 't_comment not be over 100' do
          taste.t_comment = 'a' * 101
          expect(taste.valid?).to eq(false)
        end
      end
    end
  end
end
