class OrdersController < ApplicationController
  def index
  end

  def create
    user = current_user
    item = Item.find(params[:id])
    PurchaseRecord.create(purchase_record_params(user, item))
    ShippingAddress.create(shipping_address_params(purchase_record))
    redirect_to root_path
  end

    private

    def purchase_record_params(user, item)
      params.merge(user_id: user.id, item_id: item.id)
    end

    def shipping_address_params(purchase_record)
      params.permit
        :postal_code, :prefecture_id, :city,
        :address_line, :building, :phone_number
      ).merge(purchase_record_id: purchase_record.id)
    end
end
