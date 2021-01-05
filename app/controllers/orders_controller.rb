class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user == @item.user
      redirect_to root_path
    end
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
   @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_shipping_address_params)
   if @purchase_record_shipping_address.valid?
    @purchase_record_shipping_address.save
    redirect_to root_path
   else
    render action: :index
   end
  end

    private

    # 全てのストロングパラメーターを1つに結合
    def purchase_record_shipping_address_params
      params.require(:purchase_record_shipping_address).permit(
        :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
end
