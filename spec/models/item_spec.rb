require 'rails_helper'

RSpec.describe Item, type: :model do
  # itemのダミーデータを生成
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('test_image.png')
  end

  describe '商品登録' do
    # 正常系
    context '商品登録成功' do
      it '全ての項目が正常に入力されていれば成功' do
        expect(@item).to be_valid
      end
    end

    # 異常系
    context '商品登録失敗' do
      it '出品画像が空だと失敗' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと失敗' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと失敗' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが「--」だと失敗' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が「--」だと失敗' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '発送料の負担が「--」だと失敗' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域が「--」だと失敗' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が「--」だと失敗' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it '価格が空だと失敗' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品の価格が300円未満だと失敗' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '商品の価格が9,999,999円を超えると失敗' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '商品の価格が自然数でないと失敗' do
        @item.price = 500.1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it '商品の価格が文字だと失敗' do
        @item.price = 'ごひゃくえん'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品の価格が半角英語だと失敗' do
        @item.price = 'thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
