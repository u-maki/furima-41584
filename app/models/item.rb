class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :shipping_cost, class_name: 'ShippingCost'
  belongs_to :prefecture, class_name: 'Prefecture'
  belongs_to :shipping_time, class_name: 'ShippingTime'

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_time_id, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください。' }
  validates :image, presence: true
  has_one_attached :image
  has_one :purchase_record
end
