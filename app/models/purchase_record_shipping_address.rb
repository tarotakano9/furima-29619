class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city,
                :address_line, :building, :phone_number,
                :purchase_record_id, :token, :authenticity_token,
                :user_id, :nickname, :email, :password, :family_name, :first_name,
                :first_name_kana, :family_name_kana, :birth_date, 
                :item_id, :name, :price, :description, :category_id, :delivery_fee_id,
                :days_to_ship_id

  # shipping_addressに関するバリデーション
  # 正規表現
  VALID_POSTAL_CODE_REGIX = /\A\d{3}[-]\d{4}\z/ # 3桁 - 4桁の半角数字
  VALID_PHONE_NUMBER_REGIX = /\A\d{10,11}\z/ # 10~11桁の数字

  # バリデーション
  with_options presence: true do
    validates :postal_code,   format: { with: VALID_POSTAL_CODE_REGIX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number,  format: { with: VALID_PHONE_NUMBER_REGIX }
    validates :token
  end

  def save
    # ユーザーの情報を保存して変数userに格納
    user = User.create(nickname: nickname, email: email, password: password, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, birth_date: birth_date)
    # 商品の情報を保存して変数itemに格納
    item = Item.create(name: name, price: price, description: description, category_id: category_id, delivery_fee_id: delivery_fee_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, user_id: user.id)

    # 購入記録を保存して変数purchase_recordに格納
    purchase_record = PurchaseRecord.create(user_id: user.id, item_id: item.id)
    # shipping_addressを保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end