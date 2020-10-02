# require 'rails_helper'

# RSpec.describe Purchase, type: :model do
#   before do
#     @purchase = FactoryBot.build(:purchase_shipping)
#   end

#   it "priceとtokenがあれば保存ができること" do
#     expect(@purchase).to be_valid
#   end

#   it "tokenが空では登録できないこと" do
#     @purchase.token = nil
#     @purchase.valid?
#     expect(@purchase.errors.full_messages).to include("Token can't be blank")
#   end
#   it '郵便番号が空だと登録できない' do
#     @purchase.postcode = nil
#     @item.valid?
#     expect(@purchase.errors.full_messages).to include("Price can't be blank")
#   end
#   it 'priceが空だと登録できない' do
#     @item.price = nil
#     @item.valid?
#     expect(@item.errors.full_messages).to include("Price can't be blank")
#   end
#   it 'priceが空だと登録できない' do
#     @item.price = nil
#     @item.valid?
#     expect(@item.errors.full_messages).to include("Price can't be blank")
#   end

#   it 'priceが空だと登録できない' do
#     @item.price = nil
#     @item.valid?
#     expect(@item.errors.full_messages).to include("Price can't be blank")
#   end

# end
