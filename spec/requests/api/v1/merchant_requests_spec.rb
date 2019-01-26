require 'rails_helper'

describe "Merchants API" do
  it "sends a list of all merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(5)
  end
  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"].to_i).to eq(id)
  end
  it 'can search by a name' do
    name = create_list(:merchant, 5).first.name

    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(Merchant.count).to eq(5)
    expect(merchant["name"]).to eq(name)
  end
  # it 'searches name case insensitive' do
  #   name = create(:merchant, name: "ABS TOYS").name
  #
  #   get "/api/v1/merchants/find?name=#{name}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(merchant["name"]).to eq(name)
  # end
  it 'searches all matching names' do
    merchant = create_list(:merchant, 5).first

    get "/api/v1/merchants/find_all?name=#{merchant.name}"

    merchants = JSON.parse(response.body)
    expect(response).to be_successful

    expect(merchant["name"]).to eq(merchant.name)
    expect(merchants.count).to eq(5)
  end
  it 'can return a random merchant' do
    create_list(:merchant, 5)

    get "/api/v1/merchants/random"

    JSON.parse(response.body)

    expect(response).to be_successful
  end
end

describe "Merchant Relationship Endpoints" do
  it 'returns a collection of items from that merchant' do
    merchant = create(:merchant)
    merchant.items.create(name: "boss 3000", description: "great gadget", unit_price: 20.00)
    merchant.items.create(name: "silly puddy", description: "desolves internally", unit_price: 10.00)
    merchant.items.create(name: "billys tanks", description: "toy tank", unit_price: 30.00)

    get "/api/v1/merchants/#{merchant.id}/items"

    m_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(m_items.count).to eq(3)
  end
  it 'returns a collection of invoices from merchant from orders' do
    merchant = create(:merchant)

    create_list(:invoice, 5, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    m_invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(m_invoices.count).to eq(5)
  end
end
