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
    validetes :name, length: { maximum: 40 }
    validetes :price, numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
    }
    validetes :description, length: { maximum: 1000 }
  end

  # カテゴリーが「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
    validetes :category_id
    validates :condition
    validates :days_to_ship
    validates :delivery_fee
    validates :prefecture
  end
end
