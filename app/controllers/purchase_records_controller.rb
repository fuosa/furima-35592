class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end


  private
  
    def purchase_address_params
      params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone)
      .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end



    def move_to_root_path
      redirect_to root_path if current_user.id == @item.user_id || @item.purchase_record.present?
    end

    def pay_item
      Payjp.api_key = "sk_test_145ecbb3f433fc23e4058220"
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_address_params[:token],
        currency: 'jpy'
      )
    end

end