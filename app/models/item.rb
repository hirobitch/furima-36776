class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :puchase
  has_one_attached :image

  #belongs_to :item_category_id
  #belongs_to :item_condition_id
  #belongs_to :delivery_fee_id
  #belongs_to :ship_from_address_id
  #belongs_to :day_to_ship_id

  validates :item_name, :item_description, :item_category_id, :item_condition_id, :delivery_fee_id, :delivery_fee_id, :ship_from_address_id, :day_to_ship_id, :price, :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :item_category_id, :item_condition_id, :delivery_fee_id, :ship_from_address_id, :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank"}
end
