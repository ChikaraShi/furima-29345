require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    
    @user = FactoryBot.create(:user)
    @buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @buyer.id, item_id: @item.id)
  end

  it "全てがうまくいけば、保存ができること" do
    expect(@purchase_shipping).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @purchase_shipping.token = nil
    @purchase_shipping.valid?
    expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
  end
  it '郵便番号が空だと登録できない' do
    @purchase_shipping.postcode = nil
    @purchase_shipping.valid?
    expect(@purchase_shipping.errors.full_messages).to include("Postcode can't be blank")
  end
  it '都道府県カテゴリが空だと登録できない' do
    @purchase_shipping.state_id = '1'
    @purchase_shipping.valid?
    expect(@purchase_shipping.errors.full_messages).to include('State must be other than 1')
  end
  it 'cityが空だと登録できない' do
    @purchase_shipping.city = nil
    @purchase_shipping.valid?
    expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
  end
  it 'Add lineが空だと登録できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Add line can't be blank")
  end
  
  it 'priceが空だと登録できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  
  
end