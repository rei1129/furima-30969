class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :purchase_history
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 } 
    validates :sales_status_id, numericality: { other_than: 1 } 
    validates :shipping_fee_status_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :scheduled_delivery_id, numericality: { other_than: 1 } 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery
end