class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order('created_at DESC').includes(:buyers)
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
    params.require(:item).permit(:name, :price, :image, :description, :delivery_cost_id, :prefecture_id, :until_shipping_id, :category_id, :status_id).merge(user_id: current_user.id)
  end
end
