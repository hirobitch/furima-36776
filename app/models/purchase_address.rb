class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :ship_from_address_id, :municipality, :address, :building, :tell, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :ship_from_address_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :tell, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token, presence: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, ship_from_address_id: ship_from_address_id, municipality: municipality, address: address, building: building, tell: tell, purchase_id: purchase.id)
  end
end
