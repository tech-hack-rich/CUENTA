require 'rails_helper'

RSpec.describe Account, type: :model do
  before do
    @account = FactoryBot.build(:account)
  end

  describe 'account作成' do
    context 'accountが作成できるとき' do
      it '正しくフォームを入力すれば作成できること' do
        expect(@account).to be_valid
      end

      it 'infoは空欄でもaccountは作成できること' do
        @account.info = ''
        expect(@account).to be_valid
      end
    end

    context 'accountが作成できないとき' do
      it 'nameが空欄では作成できないこと' do
        @account.name = ''
        @account.valid?
        expect(@account.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
