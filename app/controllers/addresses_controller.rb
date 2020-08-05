class AddressesController < ApplicationController
  def index
    @address = Item.find(params[:item_id])
  end

  def create
  end
end
