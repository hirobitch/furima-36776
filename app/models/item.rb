class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :puchase
  has_one_attached :image

  belongs_to_active_hash :item_category
  belongs_to_active_hash:item_condition
  belongs_to_active_hash:delivery_fee
  belongs_to_active_hash:ship_from_address
  belongs_to_active_hash :day_to_ship

  validates :item_name, :item_description, :item_category_id, :item_condition_id, :delivery_fee_id, :ship_from_address_id, :day_to_ship_id, :price, :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :item_category_id, :item_condition_id, :delivery_fee_id, :ship_from_address_id, :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank"}
end
