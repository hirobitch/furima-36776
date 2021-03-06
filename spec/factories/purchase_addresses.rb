FactoryBot.define do
  factory :purchase_address do
    postal_code          { '111-1111' }
    ship_from_address_id { 3 }
    municipality         { '新宿区' }
    address              { '新宿' }
    building             { 'ビル' }
    tell                 { '12345678900' }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
