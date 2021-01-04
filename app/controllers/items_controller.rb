class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :destroy] 

  def index
    @items = Item.includes(:user).order(id: 'DESC')
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

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      if @item.destroy
        redirect_to root_path
      else
        render :edit
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :price, :description, :category_id,
      :condition_id, :delivery_fee_id, :prefecture_id,
      :days_to_ship_id, :user, :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
