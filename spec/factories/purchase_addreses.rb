FactoryBot.define do
  factory :purchase_address do
    post_code           {'123-4567'}
    prefecture_id       {1}
    city                {'横浜市'}
    house_number        {'1-23-45'}
    building_name       {'アーバンハイツ'}
    phone               {'09012345678'}
    token               {'tok_abcdefghijk0000000000000000'}
  end
end
