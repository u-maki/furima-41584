FactoryBot.define do
  factory :item do
    product_name { 'サンプル商品' }
    product_description { '商品の説明です。' }
    category_id { 1 }
    condition_id { 1 }
    shipping_cost_id { 1 }
    prefecture_id { 1 }
    shipping_time_id { 1 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/test_image.jpg')),
        filename: 'test_image.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
