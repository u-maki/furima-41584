class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      flash.now[:alert] = '入力に不備があります。再度ご確認ください。'
      render :new, status: :unprocessable_entity
    end
  end

  # def show
  # @item = Item.find(params[:id])
  # end

  private

  def item_params
    permitted_params = params.require(:item).permit(:product_name, :product_description,
                                                    :category_id, :condition_id,
                                                    :shipping_cost_id, :prefecture_id,
                                                    :shipping_time_id, :price, :image)
    permitted_params.merge(user_id: current_user.id)
  end
end
