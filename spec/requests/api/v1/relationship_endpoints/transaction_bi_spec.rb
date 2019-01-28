require 'rails_helper'

describe "transaction relationship endpoints" do
  it 'returns the associated invoice' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    transaction = invoice_1.transactions.create(credit_card_number: 1234567891234567, credit_card_expiration_date: 10102019, result: 'success')

    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful

    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
