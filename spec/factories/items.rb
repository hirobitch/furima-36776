FactoryBot.define do
  factory :item do
    item_name              {'test'}
    item_description       {'test'}
    item_category_id       { 2 }
    item_condition_id      { 2 }
    delivery_fee_id        { 2 }
    ship_from_address_id   { 2 }
    day_to_ship_id         { 2 }
    price                  { 300 }
    association :user
   

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
