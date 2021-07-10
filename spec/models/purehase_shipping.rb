require 'rails_helper'

RSpec.describe PurehaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purehase_shipping = FactoryBot.build(:purehase_shipping, user_id: @user.id, item_id: @item.id)
    sleep 1.0
  end

    context '内容に問題ない場合' do
      it "全てが正しく保存ができること" do
        expect(@purehase_shipping).to be_valid
      end
    end


    it "tokenが空では登録できないこと" do
      @purehase_shipping.token = nil
      @purehase_shipping.valid?
      expect(@purehase_shipping.errors.full_messages).to include("Token can't be blank")
    end

  it "postal_codeが空では登録できないこと" do
    @purehase_shipping.postal_code = ''
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Postal code can't be blank")
  end

  it "postal_codeのハイフンがないと登録できないこと" do
    @purehase_shipping.postal_code = '0000000'
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Postal code is invalid")
  end

  it "delivery_area_idが1では登録できないこと" do
    @purehase_shipping.delivery_area_id = 1
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Delivery area must be other than 1")
  end

  it "municipalityが空では登録できないこと" do
    @purehase_shipping.municipality = ''
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Municipality can't be blank")
  end

  it "addressが空では登録ができないこと" do
    @purehase_shipping.address = ''
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Address can't be blank")
  end

  it "phone_numberが空では登録ができないこと" do
    @purehase_shipping.phone_number = ''
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberは11桁以内でないと登録できないこと" do
    @purehase_shipping.phone_number = '123456789123'
    @purehase_shipping.valid?
    expect(@purehase_shipping.errors.full_messages).to include("Phone number is invalid")
  end
end