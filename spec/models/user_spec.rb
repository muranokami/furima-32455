require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context do
      @user = FactoryBot.build(:user)
    end
    
    it "nicknameとemail、passwordとpassword_confirmatioとbirthdayとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end    

    it "メールアドレスが一意性であること" do
      user = User.create(name: "Test", user_id: "test", email: "taro@example.com")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      user = build(:user, email: "aaaaaa")
      user.valid?
      expect(@user.errors.full_messages).to include("is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが必須であること" do
      @user.pqssword = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password = build(:user, password: "abcd123", password_confirmation: "abcd123")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = build(:user, password: "abcd123", password_confirmation: "abcd123")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "パスワードは、半角英数字混合での入力が必須であること" do
      user = build(:user, password: "abcd123", password_confirmation: "abcd123")
      user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.nickname = "漢字"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.nickname = "漢字"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.nickname = "カンジ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
  end
end
