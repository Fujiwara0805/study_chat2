require 'rails_helper'

describe QuestionForm, type: :model do
  before do
    @question_form = FactoryBot.build(:question)
  end
  describe '投稿' do
    context '投稿がうまくいくとき' do
      it '必須項目が入力されていれば投稿ができる' do
        expect(@question_form).to be_valid
      end
    end
      context '投稿がうまくいかないとき' do
        it 'タイトルが空では登録されない' do
          @question_form.title = ''
          @question_form.valid?
        expect(@question_form.errors.full_messages).to include("Title is invalid")
        end
        it '投稿内容が空では登録されない' do
          @question_form.content = ''
          @question_form.valid?
        expect(@question_form.errors.full_messages).to include("Content is invalid")
        end
        it '投稿者名が空では登録されない' do
          @question_form.name = ''
          @question_form.valid?
        expect(@question_form.errors.full_messages).to include("Name is invalid")
        end
        it 'ユーザーが紐付いていない場合は登録できない' do
          @question_form.user = nil
          @question_form.valid?
          expect(@question_form.errors.full_messages).to include("Userを入力してください")
        end
      end
  end
end  
