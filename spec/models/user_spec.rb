require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'testuser', email: 'test@example', password: '000000', password_confirmation: '000000',
                      birthday: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'testuser', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'testuser', email: 'test@example', password: '000000', password_confirmation: '000000',
                      first_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: 'testuser', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'testuser', email: 'test@example', password: '000000', password_confirmation: '000000',
                      first_name_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'testuser', email: 'test@example', password: '', password_confirmation: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'testuser', email: '', password: '000000', password_confirmation: '000000',
                      first_name_kana: 'テスト')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
