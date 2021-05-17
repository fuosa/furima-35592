class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]

  def index
    @items = Item.all
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


  private

  def item_params
    params.require(:item).permit(:delivery_fee_id, :category_id, :condition_id, :prefecture_id, :shipping_day_id)
end

end
