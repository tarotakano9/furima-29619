FactoryBot.define do
  factory :user do
    # 日本人名を生成
    transient do
      person { Gimei.name }
   end

    nickname  {Faker::Name.name}
    email {Faker::Internet.free_email}
    fake_password = Faker::Internet.password(min_length: 6)
    password {fake_password}
    password_confirmation {fake_password}
    family_name {person.last.kanji}
    first_name {person.first.kanji}
    family_name_kana {person.last.katakana}
    first_name_kana {person.first.katakana}
    birth_date {Faker::Date.backward}
  end
end
