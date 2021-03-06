require 'rails_helper'
RSpec.describe Way, type: :model do
  before do
    @way = FactoryBot.build(:way)
    sleep 0.1
  end
  describe '試験方法の登録' do
    context '試験方法登録できる時' do
      it 'name,text,image,videoが存在すれば登録できること' do
        expect(@way).to be_valid
      end
      it 'imageが空でも登録できること' do
        @way.image = nil
        expect(@way).to be_valid
      end
      it 'videoが空でも登録できること' do
        @way.video = nil
        expect(@way).to be_valid
      end
    end
    context '試験方法登録できない時' do
      it '試験名が空だと登録できない' do
        @way.name = nil
        @way.valid?
        expect(@way.errors.full_messages).to include '試験名を入力してください'
      end

      it '説明が空だと登録できない' do
        @way.text = nil
        @way.valid?
        expect(@way.errors.full_messages).to include '説明を入力してください'
      end
    end
  end
end
