class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index

  def index
    @shipping_address = ShippingAddress.new
  end


  def create
    @shipping_address = ShippingAddress.new(order_params)
    if @shipping_address.valid?
      pay_order
      @shipping_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token],item_id:params[:item_id])
  end

  def set_product
    @item = Item.find(params[:item_id])
  end


  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
  
end
