class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :detail, :price, :user, :image, :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end


 