class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :ship_from_address_id, :municipality, :address, :building, :tell, :purchase

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :ship_from_address_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :tell, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :purchase
    #validates :token
  end

  def save
    @purchase = Purchase.create(user: user, item: item)
    shipping_address = ShippingAddress.create(postal_code: postal_code, ship_from_address: ship_from_address, municipality: municipality, address: address, building: building, tell: tell, purchase: purchase)
  end
end
