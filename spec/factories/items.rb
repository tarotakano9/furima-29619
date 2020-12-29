FactoryBot.define do
  factory :item do
    # ダミーデータ用の乱数を生成
    random = Random.new
    dammy_price = random.rand(300..9_999_999)
    dammy_category_id = random.rand(2..11)
    dammy_condition_id = random.rand(2..7)
    dammy_delivery_fee_id = random.rand(2..3)
    dammy_prefecture_id = random.rand(2..48)
    dammy_days_to_ship_id = random.rand(2..4)

    name            { Faker::Device.model_name }
    price           { dammy_price }
    description     { Faker::Lorem.characters(100) }
    category_id     { dammy_category_id }
    condition_id    { dammy_condition_id }
    delivery_fee_id { dammy_delivery_fee_id }
    prefecture_id   { dammy_prefecture_id }
    days_to_ship_id { dammy_days_to_ship_id }

    user
  end
end
