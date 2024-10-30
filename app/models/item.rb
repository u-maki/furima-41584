class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :shipping_cost, class_name: 'ShippingCost'
  belongs_to :prefecture, class_name: 'Prefecture'
  belongs_to :shipping_time, class_name: 'ShippingTime'

  validates :product_name, presence: { message: 'を入力してください' }
  validates :product_description, presence: { message: 'を入力してください' }
  with_options presence: true, exclusion: { in: [1], message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_time_id
  end
  validates :price, presence: { message: 'を入力してください' },
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999,
                      message: 'は半角入力の¥300以上、¥9,999,999以下で入力してください'
                    }
  validates :image, presence: { message: 'を添付してください' }
  validates :user, presence: { message: 'を入力してください' }
  has_one_attached :image
  # has_one :purchase_record
end
