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
      it 'categoryは1が選択された場合、保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'conditionは1が選択された場合、保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipping_chargesは1が選択された場合、保存できない' do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it 'prefectureは1が選択された場合、保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'shipping_daysは1が選択された場合、保存できない' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end
      it 'priceは全角文字では登録できないこと' do
        @item.price ='１００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceは半角英数混合では登録できないこと' do
        @item.price ='1a1a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceは半角英語だけでは登録できないこと' do
        @item.price ='aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceは299円以下では登録できないこと' do
        @item.price ='299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceは10,000,000以上では登録できないこと' do
        @item.price ='10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
