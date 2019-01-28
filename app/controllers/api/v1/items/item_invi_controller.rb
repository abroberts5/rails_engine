class Api::V1::Items::ItemInviController < ApplicationController

  def show
    render json: Item.find(params[:id]).invoice_items
  end
end
