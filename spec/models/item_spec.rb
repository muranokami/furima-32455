require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
     @item = FactoryBot.build(:item)
    end
    
    it "nameとcategoryとpriceとuserとexplanationとproduct_statusとshipping_fee_burdenとshipping_areaとshipping_dayが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "categoryが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "userが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end

    it "explanationが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "product_statusが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product_status can't be blank")
    end

    it "shipping_fee_burdenが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_fee_burden can't be blank")
    end

    it "shipping_areaが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_area can't be blank")
    end

    it "shipping_dayが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_day can't be blank")
    end
  end
end
