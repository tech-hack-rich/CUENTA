require 'rails_helper'

RSpec.describe Movement, type: :model do
  before do
    @movement = FactoryBot.build(:movement)
  end
  describe 'movementsの登録' do
    context 'movementsが登録できるとき' do
      it '正しくフォームを入力すれば登録できること' do
        expect(@movement).to be_valid
      end
    end

    context 'movementの登録ができないとき' do
      it 'accountが存在していないと登録できない' do
        @movement.account = nil
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Account must exist")
      end

      it 'amountが空欄では登録できない' do
        @movement.amount = ''
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Amount can't be blank")
      end

      it 'ammountが半角数字以外では登録できない（全角数字）' do
        @movement.amount = '１０００'
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Amount Half-width number")
      end

      it 'ammountが半角数字以外では登録できない（ローマ字）' do
        @movement.amount = 'abcd'
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Amount Half-width number")
      end

      it 'ammountが半角数字以外では登録できない（平仮名）' do
        @movement.amount = 'あいうえお'
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Amount Half-width number")
      end

      it 'amountが負の数字では登録できない' do
        @movement.amount = '-1'
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Amount Out of setting range")
      end

      it 'amountが2147483647以上では登録できない' do
        @movement.amount = '2147483648'
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Amount Out of setting range")
      end

      it 'dateが空欄では登録できない' do
        @movement.date = nil
        @movement.valid?
        expect(@movement.errors.full_messages).to include("Date can't be blank")
      end
    end
  end
end
