class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :shipping_fee_burden

  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
    validates :explanation
  end

  with_options numericality: { other_than: 1 }
    validates :category_id
    validates :product_status_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :shipping_fee_burden_id
end