class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :product_descriiption, :category_id, :product_condition_id, :price, :shipping_charge_id, :shipping_charge_id, :delivery_area_id, :days_to_delivery_id ).merge(user_id: current_user.id)
  end

end 