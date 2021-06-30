require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品' do
    context '全ての情報が正しく入力されていれば' do
      it '出品できる' do
        expect(@item).to be_valid
      end
    end
    context 'imageが空だと' do
      it '出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
    it 'prduct_nameが空だと出品できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it 'product_descriptionが空だと出品できない' do
      @item.product_descriiption = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product descriiption can't be blank")
    end
    it 'category_idが1以外でないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'product_condition_idが1以外でないと出品できない' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Product condition must be other than 1')
    end
    it 'shipping_charge_idが1以外でないと出品できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
    end
    it 'delivery_area_idが1以外でないと出品できない' do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
    end
    it 'days_to_delivery_idが1以外でないと出品できない' do
      @item.days_to_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to delivery must be other than 1')
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300未満だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが10000000以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが全角数字では出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが半角英字では出品できない' do
      @item.price = 'sample'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが半角英数字混合では出品できない' do
      @item.price = 'sample1000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'userが紐付いていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
