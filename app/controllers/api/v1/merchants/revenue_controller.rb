class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params[:date]
      render json: Merchant.total_revenue(params[:date])
    else
      render json: Merchant.all_revenue
    end
  end
end
