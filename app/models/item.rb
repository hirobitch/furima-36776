class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :puchase
  has_one_attached :image

  belongs_to :item_category_id
  belongs_to :item_condition_id
  belongs_to :item_delivery_fee_id
  belongs_to :ship_from_address_id
  belongs_to :day_to_ship_id

end
