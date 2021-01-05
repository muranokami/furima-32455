class UserPurchase
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :post_id, :shipping_area_id, :municipalitie, :address, :building_name, :phone_number, :purchase_id, :token


    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :shipping_area_id
      validates :municipalitie
      validates :address
      validates :phone_number, format: { with: /\A\d{11}\z/} 
      validates :post_id, format: { with: /\A\d{3}[-]\d{4}\z/ }
      validates :token
    end
  def save
     purchase = Purchase.create(user_id: user_id, item_id: item_id) 
     Address.create(post_id: post_id, shipping_area_id: shipping_area_id, municipalitie: municipalitie, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end