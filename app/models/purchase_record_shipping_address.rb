class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number,
                :token, :authenticity_token, :item_id, :user_id

  # 正規表現
  VALID_POSTAL_CODE_REGIX = /\A\d{3}-\d{4}\z/.freeze # 3桁 - 4桁の半角数字
  VALID_PHONE_NUMBER_REGIX = /\A\d{10,11}\z/.freeze # 10~11桁の数字

  # バリデーション
  with_options presence: true do
    validates :postal_code,   format: { with: VALID_POSTAL_CODE_REGIX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGIX }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    # purchase_recordを保存
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    # shipping_addressを保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line,
                           building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
