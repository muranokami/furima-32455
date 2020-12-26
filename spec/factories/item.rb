FactoryBot.define do
  factory :item do
    name {"花火"}
    category_id {2}
    price {"555"}
    explanation {"花火と山"}
    product_status_id {2}
    shipping_fee_burden_id {2}
    shipping_area_id {2}
    shipping_day_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
