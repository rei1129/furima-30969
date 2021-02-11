require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/test.jpg')
  end

  describe "新規出品" do
    context '新規登録が上手く行く時' do
      it "name,text,category_id,sales_status_id,shipping_status_id,shipping_fee_status_id,prefecture_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
 
    context '新規登録できないとき' do
    it "商品名が空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it "商品の説明が空では登録できない" do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Text can't be blank"
    end
    it "カテゴリーが空では登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it "商品の状態が空では登録できない" do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Sales status can't be blank"
    end
    it "配送料の負担が空では登録できない" do
      @item.shipping_fee_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
    end
    it "発送元の地域が空では登録できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it "発送までの日数が空では登録できない" do
      @item.scheduled_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
    end
    it "販売価格が空では登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it "販売価格が300円以下では登録できない" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it "販売価格が9,999,999円以上では登録できない" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    it "販売価格は半角数字でなければ保存できない" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end

   end
  end
 end
end