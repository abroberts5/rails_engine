class Api::V1::Invoices::ItemsInvoiceController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).items
  end
end
