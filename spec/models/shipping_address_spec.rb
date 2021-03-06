require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shipping_address = FactoryBot.build(:shipping_address, user_id: 1 , item_id: 1)
      sleep 0.1
    end
    context '商品購入ができる時' do

    it '全ての値が存在すれば商品購入ができること' do
      expect(@shipping_address).to be_valid
    end
    it 'building_nameが空でも商品購入することができること' do
      @shipping_address.building_name = nil
      expect(@shipping_address).to be_valid
    end
  end
  context '商品購入ができない時' do
    it 'user_idが空だと商品購入することができないこと' do
      @shipping_address.user_id = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと商品購入することができないこと' do
      @shipping_address.item_id = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'postal_codeが空だと商品購入することができないこと' do
      @shipping_address.postal_code = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeには-を含めないと商品購入することができないこと' do
      @shipping_address.postal_code = '1_001_000'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefectureが空だと商品購入することができないこと' do
      @shipping_address.prefecture_id = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Prefecture is not a number')
    end
    it 'prefectureが1だと商品購入することができないこと' do
      @shipping_address.prefecture_id = 1
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'municipalityが空だと商品購入することができないこと' do
      @shipping_address.municipality = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと商品購入することができないこと' do
      @shipping_address.address = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと商品購入することができないこと' do
      @shipping_address.phone_number = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberに-を含めると商品購入することができないこと' do
      @shipping_address.phone_number = '090-1234-5678'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが12桁以上だと商品購入することができないこと' do
      @shipping_address.phone_number = '090123456789'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが英数字混合では登録できないこと' do
      @shipping_address.phone_number = '0z0z2x4x6789'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空だと商品購入することができないこと' do
      @shipping_address.token = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Token can't be blank")
    end
  end
  end
end
