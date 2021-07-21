FactoryBot.define do
  factory :purchase_ship_address do
    postal_code    { '111-1111' }
    prefecture_id  { 2 }
    city           { Faker::Lorem.sentence }
    house_number   { '1-1' }
    phone_number   { 1_234_567_890 }
    user_id        { 1 }
    item_id        { 1 }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
