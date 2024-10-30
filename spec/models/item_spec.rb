require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build(:item) }

  describe '商品出品のバリデーションテスト' do
    context '正常系のテスト' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(item).to be_valid
      end
    end

    context '異常系のテスト' do
      it '商品名が空では保存できない' do
        item.product_name = nil
        item.valid?
        expect(item.errors[:product_name]).to include('を入力してください')
      end

      it '商品説明が空では保存できない' do
        item.product_description = nil
        item.valid?
        expect(item.errors[:product_description]).to include('を入力してください')
      end

      it '価格が300未満では保存できない' do
        item.price = 299
        item.valid?
        expect(item.errors[:price]).to include('は半角入力の¥300以上、¥9,999,999以下で入力してください')
      end

      it '価格が9999999を超えると保存できない' do
        item.price = 10_000_000
        item.valid?
        expect(item.errors[:price]).to include('は半角入力の¥300以上、¥9,999,999以下で入力してください')
      end

      it '価格が全角数字では保存できない' do
        item.price = '３００'
        item.valid?
        expect(item.errors[:price]).to include('は半角入力の¥300以上、¥9,999,999以下で入力してください')
      end

      it 'カテゴリーが1だと保存できない' do
        item.category_id = 1
        item.valid?
        expect(item.errors[:category_id]).to include('を選択してください')
      end

      it '商品状態が1だと保存できない' do
        item.condition_id = 1
        item.valid?
        expect(item.errors[:condition_id]).to include('を選択してください')
      end

      it '配送料の負担が1だと保存できない' do
        item.shipping_cost_id = 1
        item.valid?
        expect(item.errors[:shipping_cost_id]).to include('を選択してください')
      end

      it '発送元の地域が1だと保存できない' do
        item.prefecture_id = 1
        item.valid?
        expect(item.errors[:prefecture_id]).to include('を選択してください')
      end

      it '発送までの日数が1だと保存できない' do
        item.shipping_time_id = 1
        item.valid?
        expect(item.errors[:shipping_time_id]).to include('を選択してください')
      end

      it '画像が添付されていないと保存できない' do
        item.image.purge if item.image.attached?
        item.valid?
        expect(item.errors[:image]).to include('を添付してください')
      end

      it '価格が空だと保存できない' do
        item.price = nil
        item.valid?
        expect(item.errors[:price]).to include('を入力してください')
      end

      it 'ユーザーが紐づいていないと保存できない' do
        item.user = nil # ユーザーをnilにする
        item.valid? # バリデーションを実行
        expect(item.errors[:user]).to include('must exist') # 期待されるエラーメッセージを確認
      end
    end
  end
end
