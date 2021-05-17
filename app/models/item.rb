class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_fee_id
  belongs_to :prefecture_id 
  belongs_to :shipping_day_id

  
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }
  validates :price, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
end
