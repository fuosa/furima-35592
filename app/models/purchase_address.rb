class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone, :user_id, :item_id, :purchase_record_id
  
  with_options presence: true do
    # validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }
    validates :post_code, format: { with: /\A\d{3}[-]\d{3}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A[0-9]{11}\z/}
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, 
      phone: phone, purchase_record_id: purchase_record.id)
  end

end