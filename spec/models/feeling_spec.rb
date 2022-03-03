require 'rails_helper'

RSpec.describe Feeling, type: :model do
  before do
    @feeling = FactoryBot.build(:feeling)
  end

  describe '投稿の保存' do
    context '投稿できるとき' do
      it 'タイトルとテキスト、画像が存在すれば登録できる' do
        expect(@feeling).to be_valid
      end
      it '画像が空でも投稿できる' do
        @feeling.image = nil
        expect(@feeling).to be_valid
      end     
    end
    context '投稿ができないとき' do
      it 'ユーザーが紐付いていなければ投稿できない' do
        @feeling.user = nil
        @feeling.valid?
        expect(@feeling.errors.full_messages).to include('User must exist')
      end
      it 'タイトルが空では投稿できない' do
        @feeling.title = ''
        @feeling.valid?
        expect(@feeling.errors.full_messages).to include("Title can't be blank")
      end     
      it 'テキストが空では投稿できない' do
        @feeling.body = ''
        @feeling.valid?
        expect(@feeling.errors.full_messages).to include("Body can't be blank")
      end     
    end
  end
end