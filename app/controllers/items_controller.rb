class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
    return if @item.order.nil?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_user!
    return unless current_user.id != @item.user_id

    redirect_to root_path
  end

  def item_params
    permitted_params = params.require(:item).permit(:product_name, :product_description,
                                                    :category_id, :condition_id,
                                                    :shipping_cost_id, :prefecture_id,
                                                    :shipping_time_id, :price, :image)
    permitted_params.merge(user_id: current_user.id)
  end
end
