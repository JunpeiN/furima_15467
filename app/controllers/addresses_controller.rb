class AddressesController < ApplicationController
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
end
