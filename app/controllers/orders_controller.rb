class OrdersController < ApplicationController
  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
   @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_shipping_address)
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
end
