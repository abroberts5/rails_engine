require 'rails_helper'

describe "invoices relationship endpoints" do
  it "returns a collection of associated transactions" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    create(:transaction, result: "success", invoice_id: invoice.id)
    create(:transaction, result: "success", invoice_id: invoice.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    inv = JSON.parse(response.body)

    expect(response).to be_successful
    expect(inv.first["id"]).to eq(Transaction.first.id)
    expect(inv.last["id"]).to eq(Transaction.last.id)
  end
  it 'returns a collection of associated invoice items' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item_1.id)
    create(:invoice_item, invoice_id: invoice.id, item_id: item_2.id)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    inv = JSON.parse(response.body)

    expect(response).to be_successful
    expect(inv.first["id"]).to eq(invoice_item.id)
  end
  it 'returns a collection of associated items' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    item_1 = create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:invoice_item, invoice_id: invoice.id, item_id: item_1.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    inv = JSON.parse(response.body)

    expect(response).to be_successful
    expect(inv.first["id"]).to eq(item_1.id)
  end
  it 'returns the associated customer' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )

    get "/api/v1/invoices/#{invoice.id}/customer"

    cust = JSON.parse(response.body)

    expect(response).to be_successful
    expect(cust["id"]).to eq(customer.id)
  end
  it 'returns the associated merchant' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )

    get "/api/v1/invoices/#{invoice.id}/merchant"

    merch = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merch["id"]).to eq(merchant.id)
  end
end
