require 'rails_helper'

RSpec.describe User, type: :model do
  # 仮ユーザーデータの生成
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # 正常系
    context '新規登録成功' do
      it '全ての項目が正常に入力されていれば成功' do
        expect(@user).to be_valid
      end
    end

    # 異常系
    context '新規登録失敗' do
      it 'ニックネームが空だと失敗' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'パスワードが空だと失敗' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字以下だと失敗' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが6文字以上だが英字のみだと失敗' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが6文字以上だが数字のみだと失敗' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワード(確認)が空だと失敗' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'パスワード(確認)が上で打ったパスワードと異なる場合失敗' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # 以下本人確認
      # お名前(全角)
      it '苗字が空だと失敗' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '苗字が半角だと失敗' do
        @user.family_name = 'ﾐｮｳｼﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it '名前が空だと失敗' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前が半角だと失敗' do
        @user.first_name = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      # お名前カナ(全角)
      it '苗字(カナ)が空だと失敗' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it '苗字(カナ)が全角かなだと失敗' do
        @user.family_name_kana = 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it '苗字(カナ)が半角カナだと失敗' do
        @user.family_name_kana = 'ﾐｮｳｼﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it '名前(カナ)が空だと失敗' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前(カナ)が全角かなだと失敗' do
        @user.first_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '名前(カナ)が半角カナだと失敗' do
        @user.first_name_kana = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      # 生年月日
      it '生年月日が空だと失敗' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
