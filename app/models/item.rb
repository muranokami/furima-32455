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


  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :product_status_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
end