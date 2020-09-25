require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'introduceが空だと登録できない' do
      @item.introduce = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduce can't be blank")
    end
    it 'priceが空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'price数字のみ' do
      @item.price = '2ws34er'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceのmin価格範囲' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceのmax価格範囲' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'カテゴリが空だと登録できない' do
      @item.type_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Type must be other than 1")
    end
    it '商品状態が空だと登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '送料が空だと登録できない' do
      @item.ship_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship fee must be other than 1")
    end
    it '発送元が空だと登録できない' do
      @item.ship_from_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from must be other than 1")
    end
    it '発送までの日数が空だと登録できない' do
      @item.ship_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date must be other than 1")
    end
  end
end
