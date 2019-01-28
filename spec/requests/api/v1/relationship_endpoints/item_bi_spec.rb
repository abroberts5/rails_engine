require 'rails_helper'

describe "item relationship endpoints" do
  it "returns a collection of associated invoice items" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    item = create(:item, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    inv_items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(inv_items.first["id"]).to eq(invoice_item.id)
  end
  it "returns the associated merchant" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = merchant.invoices.create(status: 'shipped',
      merchant_id: merchant.id,
      customer_id: customer.id )
    item = create(:item, merchant_id: merchant.id)
    create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/items/#{item.id}/merchant"

    merch = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merch["id"]).to eq(merchant.id)
  end
end
