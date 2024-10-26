require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が正しく入力された場合、登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = '' # @userのemailを空に設定
        @user.valid? # @user.valid? を呼び出す
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが英字と数字を含まない場合、登録できない' do
        @user.password = 'password' # パスワードを英字のみに設定
        @user.password_confirmation = 'password' # 確認用パスワードも同様に設定
        @user.valid? # @user.valid? を呼び出す
        expect(@user.errors.full_messages).to include('Password は半角英字と数字を混合させてください')
      end

      it 'passwordが数字のみの場合、登録できない' do
        @user.password = '123456' # パスワードを数字のみに設定
        @user.password_confirmation = '123456' # 確認用パスワードも同様に設定
        @user.valid? # @user.valid? を呼び出す
        expect(@user.errors.full_messages).to include('Password は半角英字と数字を混合させてください')
      end

      it 'passwordが英字のみの場合、登録できない' do
        @user.password = 'abcdef' # パスワードを英字のみに設定
        @user.password_confirmation = 'abcdef' # 確認用パスワードも同様に設定
        @user.valid? # @user.valid? を呼び出す
        expect(@user.errors.full_messages).to include('Password は半角英字と数字を混合させてください')
      end

      it 'passwordが英数字混合の場合、登録できる' do
        @user.password = 'abc123' # パスワードを英数字混合に設定
        @user.password_confirmation = 'abc123' # 確認用パスワードも同様に設定
        expect(@user).to be_valid # @userが有効であることを期待
      end
    end
  end
end
