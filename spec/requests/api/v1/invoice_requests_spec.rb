require 'rails_helper'

describe "Invoice API" do
  it "has a list of invoices" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )

    get '/api/v1/invoices'

    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice.count).to eq(1)
  end
  it "can get one invoice by its id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )

    get "/api/v1/invoices/#{invoice.id}"

    inv = JSON.parse(response.body)

    expect(response).to be_successful
    expect(inv["id"]).to eq(invoice.id)
  end
end
