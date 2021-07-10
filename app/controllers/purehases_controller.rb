class PurehasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_purehase, only: [:index, :create]


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
end