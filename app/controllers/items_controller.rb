class ItemsController < ApplicationController
  # ここに before_action を記述
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # 商品一覧ページの表示処理
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, 
                                 :condition_id, :shipping_cost_id, :prefecture_id, 
                                 :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
