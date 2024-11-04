class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む形式で入力してください (例: 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字で入力してください' }
  end
end
