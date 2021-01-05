require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  # ダミーデータの生成
  before do
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address)
    @purchase_record = FactoryBot.build(:purchase_record)
  end

    # 正常系
    context '購入成功' do
      it '全ての項目が正常に入力されていれば成功' do
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    # 異常系
    context '購入失敗' do
      # 郵便番号
      it '郵便番号が空だと失敗' do
        @purchase_record_shipping_address.postal_code = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Postal code can't be blank"
        )
      end
      it '郵便番号が7桁だがハイフンがないと失敗' do
        @purchase_record_shipping_address.postal_code = "1234567"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Postal code is invalid"
        )
      end
      it '半角英字が混ざっていると失敗' do
        @purchase_record_shipping_address.postal_code = "123456a"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Postal code is invalid"
        )
      end
      it '3桁-3桁だと失敗' do
        @purchase_record_shipping_address.postal_code = "123-456"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Postal code is invalid"
        )
      end
      it '3桁-5桁だと失敗' do
        @purchase_record_shipping_address.postal_code = "123-45678"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Postal code is invalid"
        )
      end
      # 都道府県
      it '都道府県idが空だと失敗' do
        @purchase_record_shipping_address.prefecture_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Prefecture can't be blank"
        )
      end
      it '都道府県idが1だと失敗' do
        @purchase_record_shipping_address.prefecture_id = 1
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Prefecture must be other than 1"
        )
      end
      # 市区町村
      it '市区町村が空だと失敗' do
        @purchase_record_shipping_address.city = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "City can't be blank"
        )
      end
      it 'address_lineが空だと失敗' do
        @purchase_record_shipping_address.address_line = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Address line can't be blank"
        )
      end
      # 電話番号
      it '電話番号が空だと失敗' do
        @purchase_record_shipping_address.phone_number = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Phone number can't be blank"
        )
      end
      it '電話番号が9桁だと失敗' do
        @purchase_record_shipping_address.phone_number = 123456789
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Phone number is invalid"
        )
      end
      it '電話番号が12桁だと失敗' do
        @purchase_record_shipping_address.phone_number = 123456789012
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Phone number is invalid"
        )
      end
      it '電話番号にハイフンが入っていると失敗' do
        @purchase_record_shipping_address.phone_number = "123-1234-1234"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Phone number is invalid"
        )
      end
      it '電話番号に半角英字が入っていると失敗' do
        @purchase_record_shipping_address.phone_number = "123456789a"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include(
          "Phone number is invalid"
        )
      end
    end
end
