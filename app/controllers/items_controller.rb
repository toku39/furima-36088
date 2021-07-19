class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user== current_user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def items_params
    params.require(:item).permit(:title, :detail, :price, :user, :image, :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end


 