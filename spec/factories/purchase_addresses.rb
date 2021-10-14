FactoryBot.define do
  factory :purchase_address do
    user_id              { 3 }
    item_id              { 3 }

    postal_code          { '111-1111' }
    ship_from_address_id { 3 }
    municipality         { '新宿区' }
    address              { '新宿' }
    tell                 { 12345678900 }
    token                { "tok_abcdefghijk00000000000000000" }
    #purchase            { 3 } 
  end
end
