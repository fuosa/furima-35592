class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_login, only: [:edit, :update]

  def index
    @item = Item.all.order(created_at: :desc)
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
      redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :delivery_fee_id, :category_id, :condition_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_login
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end
end
