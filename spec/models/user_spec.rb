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

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'passwordあ123' # 全角文字を含むパスワード
        @user.password_confirmation = 'passwordあ123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英字と数字を混合させてください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '姓に半角文字が含まれていると登録できない' do
        @user.last_name = 'Yamada' # 半角文字を含む姓
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name はひらがな・カタカナ・漢字のみ使用できます')
      end

      it '名に半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro' # 半角文字を含む名
        @user.valid?
        expect(@user.errors.full_messages).to include('First name はひらがな・カタカナ・漢字のみ使用できます')
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'やま田Aa1!' # 平仮名、漢字、英数字、記号を含む
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナのみで入力してください。')
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'た朗Aa1!' # 平仮名、漢字、英数字、記号を含む
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナのみで入力してください。')
      end
    end
  end
end
