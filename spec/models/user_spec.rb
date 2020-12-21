require 'rails_helper'

RSpec.describe User, type: :model do
  # 仮ユーザーデータの生成
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録成功' do
      it '全ての項目が正常に入力されていれば成功' do
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗' do
      it 'ニックネームが空だと失敗' do
      end
      it 'パスワードが6文字以下だと失敗' do
      end
      it 'パスワードが6文字以上だが英字のみだと失敗' do
      end
      it 'パスワードが6文字以上だが数字のみだと失敗' do
      end
      it 'パスワード(確認)が空だと失敗' do
      end
      it 'パスワード(確認)が上で打ったパスワードと異なる場合失敗' do
      end
      # 以下本人確認

      # お名前(全角)
      it '苗字が空だと失敗' do
      end
      it '苗字が半角だと失敗' do
      end
      it '名前が空だと失敗' do
      end
      it '名前が半角だと失敗' do
      end
      
      # お名前カナ(全角)
      it '苗字が空だと失敗' do
      end
      it '苗字が全角かなだと失敗' do
      end
      it '苗字が半角カナだと失敗' do
      end
      it '名前が空だと失敗' do
      end
      it '名前が全角かなだと失敗' do
      end
      it '名前が半角カナだと失敗' do
      end

      # 生年月日
      it '生年月日が空だと失敗' do
      end
    end
  end
end
