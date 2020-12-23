class Item < ApplicationRecord  
  # ActiveHashで生成したcategoryモデルと紐づける
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_fee
  belongs_to :prefecture

  # ActiveStorageとの紐付け
  has_one_attached :image
  
  # アソシエーション
  belongs_to :user
  # has_one :purchase_record

  # バリデーションを設定する
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
    }
    validates :description, length: { maximum: 1000 }
  end

  # カテゴリーが「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :days_to_ship_id
    validates :delivery_fee_id
    validates :prefecture_id
  end
end