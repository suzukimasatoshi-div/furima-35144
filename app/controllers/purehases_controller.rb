class PurehasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_purehase, only: [:index, :create]
  before_action :sold_item
  before_action :order_item


  def index
    @order = PurehaseShipping.new
  end

  def create
    @order = PurehaseShipping.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
     @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purehase_shipping).permit(:postal_code,:delivery_area_id,:municipality,:address,:building_name,:phone_number ).merge(user_id:current_user.id,item_id:params[:item_id],token:params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_purehase
    if @item.purehase.present?
      redirect_to root_path
    end
  end

  def sold_item
    redirect_to root_path if @item.purehase.present?
  end

  def order_item
    redirect_to root_path if @item.user.id == current_user.id
  end
end