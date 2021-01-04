class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :purchase_record_id

  # purchase_recordに関するバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  # shipping_addressに関するバリデーション
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
    validates :purchase_record_id
  end

  def save
    user = User.create(nickname: nickname, email: email, password: password, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, birth_date: birth_date)
    item = Item.create(name: name, price: price, description: description, category_id: category_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, user_id, user.id)

    # purchase_recordを保存
    purchase_record = PurchaseRecord.create(user_id: user.id, item_id: item.id)
    # shipping_addressを保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, purchase_record_id, purchase_record.id)
  end
end