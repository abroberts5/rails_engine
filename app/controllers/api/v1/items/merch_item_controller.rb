class Api::V1::Items::MerchItemController < ApplicationController

  def show
    id = Item.find(params[:id]).merchant_id
    render json: Merchant.find(id)
  end
end
