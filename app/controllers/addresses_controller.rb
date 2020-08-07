class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_root
  
  def index
    @item = Item.find(params[:item_id])
    @address = ItemAddress.new
  end

  def create
    @address = ItemAddress.new(address_params)
   
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.permit(:tokun,:home_number, :item_id,:postal_code,:prefecture_id,:city,:building_name,:phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    price = Item.find(params[:item_id]).price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price, 
      card: params[:token],
      currency:'jpy'
    )
  end

  #出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移する
  #URLを直接入力して購入済みの商品ページへ遷移しようとすると、トップページに遷移すること
  def redirect_root
    user = current_user.id
    user_id = Item.find(params[:item_id]).user_id
    item_id = Item.find(params[:item_id]).id
    if user == user_id || Address.exists?(item_id: item_id)
    redirect_to root_path
    end
  end
end
