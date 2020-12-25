FactoryBot.define do
    factory :user do
      nickname {"test"}
      email {"sample@com"}
      password {"rest163"}
      password_confirmation {"rest163"}
      birthday {"2000-03-20"}
      first_name {"田中"}
      last_name {"大"}
      first_name_kana {"タナカ"}
      last_name_kana {"ダイ"}
    end
end