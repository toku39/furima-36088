class PurchaseShipAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  validate :building_name
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                       phone_number: phone_number, building_name: building_name, purchase_id: purchase.id)
  end
end
