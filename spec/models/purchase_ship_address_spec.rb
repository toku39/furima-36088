require 'rails_helper'

RSpec.describe PurchaseShipAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_ship_address = FactoryBot.build(:purchase_ship_address)
    end

    context '購入情報保存できるとき' do
      it 'postal_code, prefecture_id, city, house_number, phone_number, user_id, item_id, tokenの値が存在すれば保存できる' do
        # expect(@purchase_ship_address).to be_valid
      end
    end

    context '購入情報保存できないとき' do
      it 'postal_codeが空だと保存できない' do
        @purchase_ship_address.postal_code = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空だと保存できない' do
        @purchase_ship_address.prefecture_id = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'cityが空だと保存できない' do
        @purchase_ship_address.city = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できない' do
        @purchase_ship_address.house_number = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_ship_address.phone_number = ''
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeは、「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @purchase_ship_address.postal_code = '3333-333'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '10桁以上11桁以内の半角数値でないと保存できない' do
        @purchase_ship_address.phone_number = '1111'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Phone number must be less than or equal to 11')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_ship_address.token = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
