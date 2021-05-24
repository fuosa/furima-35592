require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  
  describe '商品の購入' do

    context '商品の購入記録が保存できるとき' do

      it '全ての項目が記入されていれば購入記録が保存できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空欄でも購入記録が保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品の購入記録が保存できないとき' do

      it 'post_codeが空では購入記録が保存できない' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Post code can't be blank"
      end

      it 'post_codeにハイフンがないと購入記録が保存できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Post code is invalid"
      end

      it 'prefectureが空では購入記録が保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture must be other than 0"
      end

      it 'cityが空では購入記録が保存できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "City can't be blank"
      end

      it 'house_numberが空では購入記録が保存できない' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
      end

      it 'phoneが空では購入記録が保存できない' do
        @purchase_address.phone = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone can't be blank", "Phone is invalid"
      end

      it 'phone11桁以上では購入記録が保存できない' do
        @purchase_address.phone = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone is invalid"
      end

      it 'phoneにハイフンがあると購入記録の保存ができない' do
        @purchase_address.phone = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone is invalid"
      end

      it 'user情報がないと購入記録の保存ができない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end
    
      it 'item情報がないと購入記録の保存ができない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
      end
    end


  end
end