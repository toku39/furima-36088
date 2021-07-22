class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  # before_action :redirect_top_page, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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
  end

  def edit
    redirect_to root_path unless @item.user == current_user
  end

  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:title, :detail, :price, :user, :image, :category_id, :condition_id, :shipping_charges_id,
                                 :prefecture_id, :shipping_days_id, :purchase_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def redirect_top_page
    redirect_to root_path if @item.user == current_user && @item.purchase.present?
  end
end
