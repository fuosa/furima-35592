require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do

    context '商品出品ができるとき' do

      it "全ての項目が記入されていれば出品ができる" do
        expect(@item).to be_valid
      end

      it 'priceが半角数字である場合、出品できる' do
        @item.price = '11111'
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'category_idが空では出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end

      it 'condition_idが空では出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 0"
      end

      it 'delivery_fee_idが空では出品できない' do
        @item.delivery_fee_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 0"
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end

      it 'shipping_day_idが空では出品できない' do
        @item.shipping_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day must be other than 0"
      end

      it 'priceが空では出品できない' do
        @item.price = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 300"
      end
      
      it 'priceが半角数字でないと出品できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが¥300~¥9,999,999の間でないと、出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 300"
      end
    end
  end
end
