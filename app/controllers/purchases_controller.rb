class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @user_purchase = UserPurchase.new(set_params)
    @item = Item.find(params[:item_id])
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      return redirect_to root_path
    else  
      render 'index'
    end
  end

  private

    def set_params
      params.require(:user_purchase).permit(:post_id, params[:post_id], :municipalitie, :address, :building_name, :phone_number, :purchase_id, :shipping_area_id, params[:shipping_area_id]).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: set_params[:token],
        currency: 'jpy'
      )
    end

    def sold_out_item
      @item = Item.find(params[:item_id])
      redirect_to root_path if @item.purchase.present?
    end

end
