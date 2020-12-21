class Item < ApplicationRecord
  # ActiveStorageとの紐付け
  has_one_attached :image
  
  # アソシエーション
  belongs_to :user
  # has_one :purchase_record
end
