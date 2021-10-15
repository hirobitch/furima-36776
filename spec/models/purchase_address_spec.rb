require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
describe '商品購入' do  
  before do
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id)
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
    sleep 0.1
  end

    context '商品購入できる場合' do
      it 'user_idとitem_id、postal_codeとship_from_address_idとmunicipalityとaddressとtellとtokenが存在して、購入の都度住所を入力すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'user_idが空では登録できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'ship_from_address_idが空では購入できない' do
        @purchase_address.ship_from_address_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Ship from address can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tellが空では購入できない' do
        @purchase_address.tell = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tell can't be blank")
      end

      it 'tokenが空では購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

        it 'postal_codeが「3桁ハイフン4桁」の半角文字列のみでないと購入できない' do
          @purchase_address.postal_code = '１111_111'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'tellが10桁以上の半角数値のみでないと購入できない' do
          @purchase_address.tell = 'a23456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tell Input only number")
        end

        it 'tellが11桁以下の半角数値のみでないと購入できない' do
          @purchase_address.tell = 'a23456789000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tell Input only number")
        end
        it 'buildingは任意である' do
          @purchase_address.building = ''
          @purchase_address.valid?
        end

          it 'tellが11桁以下の半角数値のみでないと購入できない' do
          @purchase_address.tell = 'a23456789000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Tell Input only number")
        end
      end 
  end 
end   