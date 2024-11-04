class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    if @order.valid?
      @order.save
      redirect_to root_path, notice: '購入が完了しました。'
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_record_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
