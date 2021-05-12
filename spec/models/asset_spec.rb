require 'rails_helper'

RSpec.describe Asset, type: :model do
  before do
    @asset = FactoryBot.build(:asset)
  end

  describe 'assetsの登録' do
    context 'assetsが登録できるとき' do
      it '正しくフォームを入力すれば登録できること' do
        expect(@asset).to be_valid
      end
    end

    context 'assetの登録ができないとき' do
      it 'accountが存在していないと登録できない' do
        @asset.account = nil
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Account must exist")
      end

      it 'amountが空欄では登録できない' do
        @asset.amount = ''
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Amount can't be blank")
      end

      it 'ammountが半角数字以外では登録できない（全角数字）' do
        @asset.amount = '１０００'
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Amount Half-width number")
      end

      it 'ammountが半角数字以外では登録できない（ローマ字）' do
        @asset.amount = 'abcd'
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Amount Half-width number")
      end

      it 'ammountが半角数字以外では登録できない（平仮名）' do
        @asset.amount = 'あいうえお'
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Amount Half-width number")
      end

      it 'amountが負の数字では登録できない' do
        @asset.amount = '-1'
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Amount Out of setting range")
      end

      it 'amountが2147483647以上では登録できない' do
        @asset.amount = '2147483648'
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Amount Out of setting range")
      end

      it 'dateが空欄では登録できない' do
        @asset.date = nil
        @asset.valid?
        expect(@asset.errors.full_messages).to include("Date can't be blank")
      end
    end
  end
end
