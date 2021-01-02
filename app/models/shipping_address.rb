class ShippingAddress < ApplicationRecord
  # ActiveHashで生成したモデルとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # アソシエーション
  belongs_to :purchase_record

  # 正規表現
  VALID_POSTAL_CODE_REGIX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_NUMBER_REGIX = /\A\d{3}[-]\d{4}[-]\d{4}\z/

  # バリデーション
  with_options presence: true do
    validates :postal_code,   format: { with: VALID_POSRAL_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number,  format: { with: VALID_PHONE_NUMBER_REGIX }
  end
end
