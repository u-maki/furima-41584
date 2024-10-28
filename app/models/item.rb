class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category, class_name: 'Category'
  belongs_to :condition, class_name: 'Condition'
  belongs_to :shipping_cost, class_name: 'ShippingCost'
  belongs_to :prefecture, class_name: 'Prefecture'
  belongs_to :shipping_time, class_name: 'ShippingTime'

  has_one_attached :image
  has_one :purchase_record

  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_time_id, presence: true
  validates :product_name, :product_description, :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください。' }

  # 販売手数料を計算するメソッド
  def selling_fee
    (price * 0.1).floor
  end

  # 販売利益を計算するメソッド
  def profit
    (price - selling_fee).floor
  end
end
