class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if current_user == @item.user || PurchaseRecord.exists?(item_id: @item.id)
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    unless PurchaseRecord.exists?(item_id: @item.id)
      @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_shipping_address_params)
      if @purchase_record_shipping_address.valid?
        pay_item
        @purchase_record_shipping_address.save(current_user, @item)
        redirect_to root_path
      else
        render action: :index
      end
    end
  end

  private

  # 全てのストロングパラメーターを1つに結合
  def purchase_record_shipping_address_params
    params.require(:purchase_record_shipping_address).permit(
      :postal_code, :prefecture_id, :city,
      :address_line, :building, :phone_number,
      :purchase_record_id
    ).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_shipping_address_params[:token],
      currency: 'jpy'
    )
  end
end
