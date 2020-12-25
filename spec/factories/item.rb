FactoryBot.define do
  factory :item do
    name {花火}
    image
    category {その他}
    price {300}
    explanation {花火と山}
    product_status {新品}
    shipping_fee_burden {送料込み}
    shipping_area {兵庫県}
    shipping_day {2}
    user {名前}
  end
end
