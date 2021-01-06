class PurchaseRecord < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :shipping_address, dependent: :destroy
end
