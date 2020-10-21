require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "商品出品" do
    before do
      @item = FactoryBot.build(:item)  
    end

    it '全ての項目が正しく入力されていれば登録できる' do 
      expect(@item).to be_valid
    end
    
    it '商品名がなければ登録できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明がないと登録できない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが選択されていなければ登録できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態が選択されていなければ登録できない' do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '配送料の負担が選択されていなければ登録できない' do
      @item.postage_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it '発送元の地域が選択されていなければ登録できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数が選択されていなければ登録できない' do
      @item.shipping_days_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end
    it '販売価格が入力されていなければ登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が全角数字では登録できない' do
      @item.price = "９００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '販売価格が¥10,000,000より高い金額では登録できない' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it '販売価格が¥300未満では登録できない' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end
    it '画像がないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end 
end