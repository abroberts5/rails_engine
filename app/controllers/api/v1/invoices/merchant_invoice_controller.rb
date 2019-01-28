class Api::V1::Invoices::MerchantInvoiceController < ApplicationController

  def show
    id = Invoice.find(params[:id]).merchant_id
    render json: Merchant.find(id)
  end
end
