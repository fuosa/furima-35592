FactoryBot.define do
  factory :purchase_record do
    # validates :post_code, format: { with: /\A\d{3}[-]\d{3}\z/}
    # validates :prefecture_id, numericality: { other_than: 0 }
    # validates :city
    # validates :house_number
    # validates :phone, format: { with: /\A[0-9]{11}\z/}
    
    post_code           {123-4567}
    prefecture_id       {2}
    city                {横浜市}
    house_number        {1-23-45}
    phone               {09012345678}
  end
end
