class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
   has_one :order_shipping_address
end
