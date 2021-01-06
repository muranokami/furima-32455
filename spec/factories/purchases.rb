FactoryBot.define do
  factory :user_purchase do
    user_id {2}
    item_id {3}
    post_id {'123-4567'}
    shipping_area_id {5}
    municipalitie {'神戸市'}
    address {'1-1'}
    building_name {'東京ハイツ'}
    phone_number {12345678900}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
