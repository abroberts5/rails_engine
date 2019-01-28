class Api::V1::Invoices::CustomerInvoiceController < ApplicationController

  def show
    id = Invoice.find(params[:id]).customer_id
    render json: Customer.find(id)
  end
end
