class Item < ApplicationRecord  
  # ActiveHashで生成したcategoryモデルと紐づける
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # ActiveStorageとの紐付け
  has_one_attached :image
  
  # アソシエーション
  belongs_to :user
  # has_one :purchase_record

  # バリデーションを設定する
  with_options presence: true do
    validetes :name, length: { maximum: 40 }
    validetes :price
    validetes :description
  end

  # カテゴリーが「--」の時は保存できないようにする
  validetes :category_id, numericality: { other_than: 1 }
end
