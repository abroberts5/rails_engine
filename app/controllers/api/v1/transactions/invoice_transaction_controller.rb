class Api::V1::Transactions::InvoiceTransactionController < ApplicationController

  def show
    id = Transaction.find(params[:id]).invoice_id
    render json: Invoice.find(id)
  end
end
