FactoryBot.define do
  factory :item do
    association :user
    name { 'しな' }
    introduce { 'いいものいいもの' }
    type_id { 2 }
    condition_id { 2 }
    ship_fee_id  { 2 }
    ship_from_id { 2 }
    ship_date_id { 2 }
    price { 23_456 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
