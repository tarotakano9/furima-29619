class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, confirmation: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
    validates :birth_date
    # パスワードの2回入力を必須にする
    validates :password_confirmation
  end

  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX } do
    validates :family_name_kana
    validates :first_name_kana
  end

  # アソシエーション
  has_many :items
  # has_many :phachase_records
end
