require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#create' do
    before do
     @purchase = FactoryBot.build(:user_purchase)
    end

    it "user_idとitem_idとpost_idとshipping_area_idとmunicipalitieとaddressとphone_numberとtokenが存在すれば登録できること" do
      expect(@purchase).to be_valid
    end

    it "user_idが空では登録できないこと" do
      @purchase.user_id = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @purchase.item_id = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item can't be blank")
    end

    it "post_idが空では登録できないこと" do
      @purchase.post_id = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post can't be blank")
    end

    it "post_idにはハイフンが必要であること" do
      @purchase.post_id = 1234567
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Post is invalid")
    end

    it "shipping_area_idが空では登録できないこと" do
      @purchase.shipping_area_id = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
    end

    it "municipalitieが空では登録できないこと" do
      @purchase.municipalitie = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Municipalitie can't be blank")
    end

    it "addressが空では登録できないこと" do
      @purchase.address = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end

    it "building_numberが空でも登録できること" do
      @purchase.building_name = ""
      @purchase.valid?
    end

    it "phone_numberが空では登録できないこと" do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberにはハイフンが不要" do
      @purchase.phone_number = 123-4567-34
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberは11桁以内であること" do
      @purchase.phone_number = 123456789012
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
