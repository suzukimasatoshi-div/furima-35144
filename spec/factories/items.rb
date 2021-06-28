FactoryBot.define do
  factory :item do
    product_name { '商品券' }
    product_descriiption { 'これは商品券です' }
    category_id          { 2 }
    product_condition_id { 2 }
    price                { 350 }
    shipping_charge_id   { 2 }
    delivery_area_id     { 2 }
    days_to_delivery_id  { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
