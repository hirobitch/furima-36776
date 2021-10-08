require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報を保存' do
    context '商品情報を保存できる場合' do
      it 'item_nameとitem_description、item_category_idとitem_condition_idとdelivery_fee_idとship_from_address_idとday_to_ship_idとpriceとimageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報を保存できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'item_category_idが空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_condition_idが空では登録できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'ship_from_address_idが空では登録できない' do
        @item.ship_from_address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from address can't be blank")
      end
      it 'day_to_ship_idが空では登録できない' do
        @item.day_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceは、¥299以下では保存できない' do
        @item.price = 111
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは、¥10000000以上では保存できない' do
        @item.price = 11_111_111
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは半角数字のみでないと保存できない' do
        @item.price = '１11111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'item_category_idに「---」が選択されている場合は出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_condition_idに「---」が選択されている場合は出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'delivery_fee_idに「---」が選択されている場合は出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'ship_from_address_idに「---」が選択されている場合は出品できない' do
        @item.ship_from_address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from address can't be blank")
      end
      it 'day_to_ship_idに「---」が選択されている場合は出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end

      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
