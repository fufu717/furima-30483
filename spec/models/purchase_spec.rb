require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "商品購入" do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'postal_codeが空だと購入できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeがハイフンを含まない形では購入できない' do
      @order.postal_code = '1111111'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectureを選択していないと登録できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと購入できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'Addressが空では購入できない'do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも購入できる' do
      @order.building = ''
      expect(@order).to be_valid
    end
    it 'phoneが空では購入できない' do
      @order.phone = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが10桁未満だと購入できない' do
      @order.phone = '111111111'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone is invalid")
    end
    it 'phoneがハイフンを含む場合購入できない' do
      @order.phone = '090-1111-1111'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone is invalid")
    end
  end
end
