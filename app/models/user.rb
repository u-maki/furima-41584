class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龯ー々]+\z/

  validates :password, format: { with: PASSWORD_REGEX, message: 'は半角英字と数字を混合させてください' }
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'はひらがな・カタカナ・漢字のみ使用できます' }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'はひらがな・カタカナ・漢字のみ使用できます' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナのみで入力してください。' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナのみで入力してください。' }
end
