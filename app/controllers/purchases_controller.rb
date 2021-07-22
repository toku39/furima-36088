class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item_id, only: [:index, :create]

  def index
    @purchase_ship_address = PurchaseShipAddress.new
    redirect_to root_path if @item.user == current_user || !@item.purchase.nil?
  end

  def create
    @purchase_ship_address = PurchaseShipAddress.new(purchase_params)
    if @purchase_ship_address.valid?
      pay_item
      @purchase_ship_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_ship_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def find_item_id
    @item = Item.find(params[:item_id])
  end
end
