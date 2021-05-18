FactoryBot.define do
  factory :item do
    item_name                    {'test'}
    description                  {Faker::Lorem.sentence}
    category_id                  {'1'}
    condition_id                 {'1'}
    delivery_fee_id              {'1'}
    prefecture_id                {'1'}
    shipping_day_id              {'1'}
    price                        {'11111'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end

    association :user

  end
end
