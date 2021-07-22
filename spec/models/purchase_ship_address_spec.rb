require 'rails_helper'

RSpec.describe PurchaseShipAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_ship_address = FactoryBot.build(:purchase_ship_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '購入情報保存できるとき' do
      it 'postal_code, prefecture_id, city, house_number, phone_number, user_id, item_id, tokenの値が存在すれば保存できる' do
        expect(@purchase_ship_address).to be_valid
      end

      it '建物名が空の状態であっても、保存できること' do
        @purchase_ship_address.building_name = ''
        expect(@purchase_ship_address).to be_valid
      end
    end

    context '購入情報保存できないとき' do
      it 'postal_codeが空だと保存できない' do
        @purchase_ship_address.postal_code = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空だと保存できない' do
        @purchase_ship_address.prefecture_id = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'cityが空だと保存できない' do
        @purchase_ship_address.city = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できない' do
        @purchase_ship_address.house_number = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @purchase_ship_address.phone_number = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeは、「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @purchase_ship_address.postal_code = '3333-333'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'phone_numberは10桁以上11桁以内の半角数値でないと保存できない' do
        @purchase_ship_address.phone_number = '123456'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_ship_address.token = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @purchase_ship_address.user_id = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @purchase_ship_address.item_id = nil
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'phone_numberは英数混合では登録できないこと' do
        @purchase_ship_address.phone_number = '12345abcde'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'postal_codeはハイフン無しでは登録できないこと' do
        @purchase_ship_address.postal_code = '0898098'
        @purchase_ship_address.valid?
        expect(@purchase_ship_address.errors.full_messages).to include("Postal code is invalid")
      end

    end
  end
end
