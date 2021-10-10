class Purchase < ApplicationRecord
belongs_to :item
belong_to :user
has_one :shipping_address

end
