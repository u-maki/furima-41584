require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品のバリデーションテスト' do
    let(:item) { build(:item) }

    context '正常系のテスト' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(item).to be_valid
      end
    end

    context '異常系のテスト' do
      it '商品名が空では保存できない' do
        item.product_name = ''
        item.valid?
        expect(item.errors[:product_name]).to include('を入力してください')
      end

      it '商品説明が空では保存できない' do
        item.product_description = ''
        item.valid?
        expect(item.errors[:product_description]).to include('を入力してください')
      end

      it '価格が300未満では保存できない' do
        item.price = 299
        item.valid?
        expect(item.errors[:price]).to include('は300以上の値にしてください')
      end

      it '価格が9999999を超えると保存できない' do
        item.price = 10_000_000
        item.valid?
        expect(item.errors[:price]).to include('は9999999以下の値にしてください')
      end

      it '価格が全角数字では保存できない' do
        item.price = '３００'
        item.valid?
        expect(item.errors[:price]).to include('は半角数字で入力してください。')
      end

      it 'カテゴリーが未選択だと保存できない' do
        item.category_id = nil
        item.valid?
        expect(item.errors[:category_id]).to include('を入力してください')
      end

      it '商品の状態が未選択だと保存できない' do
        item.condition_id = nil
        item.valid?
        expect(item.errors[:condition_id]).to include('を入力してください')
      end

      it '配送料の負担が未選択だと保存できない' do
        item.shipping_cost_id = nil
        item.valid?
        expect(item.errors[:shipping_cost_id]).to include('を入力してください')
      end

      it '発送元の地域が未選択だと保存できない' do
        item.prefecture_id = nil
        item.valid?
        expect(item.errors[:prefecture_id]).to include('を入力してください')
      end

      it '発送までの日数が未選択だと保存できない' do
        item.shipping_time_id = nil
        item.valid?
        expect(item.errors[:shipping_time_id]).to include('を入力してください')
      end

      it '画像が添付されていないと保存できない' do
        item.image = nil
        item.valid?
        expect(item.errors[:image]).to include('を入力してください')
      end
    end
  end
end
