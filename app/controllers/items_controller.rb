class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_unless, only: [:edit, :update, :destroy]
  before_action :set_purehase, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  def item_params
    params.require(:item).permit(:image, :product_name, :product_descriiption, :category_id, :product_condition_id, :price,
                                 :shipping_charge_id, :delivery_area_id, :days_to_delivery_id).merge(user_id: current_user.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_unless
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def set_purehase
    if @item.purehase.present?
      redirect_to root_path
    end
  end
end