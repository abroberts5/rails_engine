require 'rails_helper'

describe "Transactions API" do
  it "has a list of items from transaction" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    invoice.transactions.create(credit_card_number: 1234567891234567, credit_card_expiration_date: 10102019, result: 'success')
    invoice.transactions.create(credit_card_number: 1234567891232222, credit_card_expiration_date: 10102020, result: 'success')

    get '/api/v1/transactions'

    expect(response).to be_successful
    trans = JSON.parse(response.body)
    expect(trans.count).to eq(2)
  end
  it "can get one transaction by its id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    transaction = invoice.transactions.create(credit_card_number: 1234567891238888, credit_card_expiration_date: 10102019, result: 'success')

    get "/api/v1/transactions/#{transaction.id}"

    transaction_1 = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction_1["id"]).to eq(transaction.id)
  end
end
