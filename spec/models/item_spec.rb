require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) 
  end

  describe '商品情報保存' do
    context '商品情報保存できるとき' do
      it 'title, detail, price, image, category, condition, shipping_charges, prefecture, shipping_daysの値が存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報保存できないとき' do
      it 'titleが空だと保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'detailが空だと保存できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空だと保存できない' do
        @item.image = nil
         @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryが空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'conditionが空だと保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'shipping_chargesが空だと保存できない' do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges is not a number")
      end
      it 'prefectureが空だと保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'shipping_daysが空だと保存できない' do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days is not a number")
      end

    end

  end


end
