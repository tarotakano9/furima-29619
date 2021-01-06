FactoryBot.define do
  factory :purchase_record_shipping_address do
    # 乱数で値を生成
    random = Random.new

    dammy_phone_number = '0'
    10.times do
      num = random.rand(0..9)
      dammy_phone_number = "#{dammy_phone_number}#{num}"
    end

    dammy_head = ''
    3.times do
      num = random.rand(0..9)
      dammy_head = "#{dammy_head}#{num}"
    end

    dammy_tail = ''
    4.times do
      num = random.rand(0..9)
      dammy_tail = "#{dammy_tail}#{num}"
    end

    dammy_postal_code = "#{dammy_head}-#{dammy_tail}"
    dammy_prefecture_id = random.rand(2..48)
    dammy_purchase_record_id = random.rand(1..99)
    dammy_user_id = random.rand(1..99)
    dammy_item_id = random.rand(1..99)

    # gimeiで住所を生成
    address = Gimei.address
    dammy_city = address.city.kanji
    dammy_address_line = "#{address.town.kanji}#{random.rand(1..99)}-#{random.rand(1..99)}"
    dammy_building = address.town.kanji

    postal_code { dammy_postal_code }
    prefecture_id { dammy_prefecture_id }
    city { dammy_city }
    address_line { dammy_address_line }
    building { dammy_building }
    phone_number { dammy_phone_number }
    token { 'tok_abcdefghijk00000000000000000' }

    association :user_id, factory: :user
    association :item_id, factory: :item
  end
end
