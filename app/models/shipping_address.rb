class ShippingAddress < ApplicationRecord
  # ActiveHashで生成したモデルとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # アソシエーション
  belongs_to :purchase_record
end
