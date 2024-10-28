FactoryBot.define do
  factory :user do
    nickname { 'testuser' }
    email    { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { password }
    birthday { '2000-01-01' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
  end
end
