require 'rails_helper'

describe "InvoiceItems API" do
  it "has a list of invoice_items" do
    merchant = create(:merchant)
    customer = create(:customer)
    item_1 = merchant.items.create(name: 'bobos', description: 'great stuff', unit_price: 10.00, merchant_id: merchant.id)
    item_2 = merchant.items.create(name: 'mimim', description: 'terrible stuff', unit_price: 2.00, merchant_id: merchant.id)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    create(:invoice_item, quantity: 2, unit_price: 20.00, item_id: item_1.id, invoice_id: invoice.id)
    create(:invoice_item, quantity: 1, unit_price: 2.00, item_id: item_2.id, invoice_id: invoice.id)

    get '/api/v1/invoice_items'

    expect(response).to be_successful
    invoiceitem = JSON.parse(response.body)
    expect(invoiceitem.count).to eq(2)
  end
  it "can find one invoice item by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    item_1 = merchant.items.create(name: 'bobos', description: 'great stuff', unit_price: 10.00, merchant_id: merchant.id)
    merchant.items.create(name: 'mimim', description: 'terrible stuff', unit_price: 2.00, merchant_id: merchant.id)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    invoice_item = create(:invoice_item, quantity: 2, unit_price: 20.00, item_id: item_1.id, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}"

    ii = JSON.parse(response.body)

    expect(response).to be_successful
    expect(ii["id"]).to eq(invoice_item.id)
  end
end
