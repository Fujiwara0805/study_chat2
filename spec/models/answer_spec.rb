require 'rails_helper'
describe Answer, type: :model do
  before do
    @answer = FactoryBot.build(:answer)
  end
  describe '回答' do
    context '回答がうまくいくとき' do
      it '必須項目が入力されていれば投稿ができる' do
        expect(@answer).to be_valid
      end
    end
      context '回答がうまくいかないとき' do
        it '投稿内容が空では登録されない' do
          @answer.content = ''
          @answer.valid?
        expect(@answer.errors.full_messages).to include("Questionを入力してください", "Contentを入力してください")
        end
        it '投稿者名が空では登録されない' do
          @answer.name = ''
          @answer.valid?
        expect(@answer.errors.full_messages).to include("Questionを入力してください", "Nameを入力してください")
        end
      end
  end
end  