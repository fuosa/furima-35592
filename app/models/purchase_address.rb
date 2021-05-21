class PurchaseAddress

  include ActiveModel::module
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_number, :phone, :purchase_record, :user_id, :item_id
  
  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :building_number
    validates :phone, format: { with: /\A[0-9]{11}\z/, message: 'Input only number' }
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, purchase_record_id: purchase_record.id)
  end
end