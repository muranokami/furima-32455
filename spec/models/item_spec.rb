require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
     @item = FactoryBot.build(:item)
    end
    
    it "nameとimageとcategoryとpriceとuserとexplanationとproduct_statusとshipping_fee_burdenとshipping_areaとshipping_dayが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end


    it "priceが空では登録できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "explanationが空では登録できないこと" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "categoryが--では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "categoryが空では登録できないこと" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end


    it "product_statusが--では登録できないこと" do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
    end

    it "product_statusが空では登録できないこと" do
      @item.product_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")
    end

    it "shipping_fee_burdenが--では登録できないこと" do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
    end

    it "shipping_fee_burdenが空では登録できないこと" do
      @item.shipping_fee_burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end

    it "shipping_areaが--では登録できないこと" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it "shipping_areaが空では登録できないこと" do
      @item.shipping_area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it "shipping_dayが--では登録できないこと" do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it  "shipping_dayが空では登録できないこと" do
      @item.shipping_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
  end
end
