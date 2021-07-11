FactoryBot.define do
  factory :purehase_shipping do
  token               { 'tok_0000000000000000000000000000' }
  postal_code         { '123-4567' }
  delivery_area_id    { 2 }
  municipality        { '鳥取県' }
  address             { '鳥取市' }
  building_name       { '鳥取ビル' }
  phone_number        { '08012321232' }
  end
end
