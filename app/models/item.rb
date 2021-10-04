class Item < ApplicationRecord
  belongs_to :user
  has_one :puchase
  has_one_attached :image
end
