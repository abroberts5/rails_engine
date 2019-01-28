require 'rails_helper'

describe 'merchant business intelligence' do
  before(:each) do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)

    item_1 = merchant_1.items.create(name: "boss 3000", description: "great gadget", unit_price: 350.00)
    item_2 = merchant_2.items.create(name: "silly puddy", description: "desolves internally", unit_price: 300.00)
    item_3 = merchant_3.items.create(name: "vps 202", description: "get this", unit_price: 100.00)

    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    invoice_3 = create(:invoice, merchant: merchant_3)

    create(:invoice_item, quantity: 350, unit_price: 300, item_id: item_1.id, invoice_id: invoice_1.id)
    create(:invoice_item, quantity: 300, unit_price: 200, item_id: item_2.id, invoice_id: invoice_2.id)
    create(:invoice_item, quantity: 100, unit_price: 100, item_id: item_3.id, invoice_id: invoice_3.id)

    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
    create(:transaction, invoice_id: invoice_3.id, result: "success")
  end
  it 'returns the top x merchants ranked by total revenue' do

    get "/api/v1/merchants/most_revenue?quantity=1"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.first["id"]).to eq(Merchant.first.id)
    expect(merchants.first["name"]).to eq(Merchant.first.name)
  end
  it 'returns the top x merchants ranked by total number of items sold' do

    get "/api/v1/merchants/most_items?quantity=1"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful

    expect(merchants.first["id"]).to eq(Merchant.first.id)
    expect(merchants.first["name"]).to eq(Merchant.first.name)
  end
  it 'returns the total revenue for date x across all merchants' do

    get "/api/v1/merchants/revenue?date=#{Transaction.last.updated_at}"

    merchants = JSON.parse(response.body)

    expect(merchants.first["id"]).to eq(Merchant.last.id)
  end
end
