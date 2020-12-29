class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit  
    end
  end

  def destroy
    unless @item.user_id == current_user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :price, :category_id, :product_status_id, :shipping_area_id, :shipping_day_id, :shipping_fee_burden_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
