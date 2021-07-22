FactoryBot.define do
  factory :purchase_ship_address do
    postal_code    { '111-1111' }
    prefecture_id  { 2 }
    city           { Faker::Lorem.sentence }
    house_number   { '1-1' }
    building_name  { Faker::Lorem.sentence }
    phone_number   { 1_234_567_890 }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
