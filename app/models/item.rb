class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee_id
  belongs_to :category_id
  belongs_to :condition_id 
  belongs_to :prefecture_id 
  belongs_to :shipping_day_id

  validates :delivery_fee_id, :category_id, :condition_id, :prefecture_id, :shipping_day_id, presence: true, numericality: { other_than: 1 } 
end
