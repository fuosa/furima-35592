class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
      unless @item.user_id == current_user.id
        redirect_to action: :index
      end
    end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :delivery_fee_id, :category_id, :condition_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
   unless @item.user_id_signed_in?
    redirect_to action: :index
   end
  end
end
