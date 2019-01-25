require 'rails_helper'

describe "Items API" do
  it "has a list of items from merchant" do
    merchant = create(:merchant)
    merchant.items.create(name: "boss 3000", description: "great gadget", unit_price: 20.00)
    merchant.items.create(name: "silly puddy", description: "desolves internally", unit_price: 10.00)

    get '/api/v1/items'

    expect(response).to be_successful
    item = JSON.parse(response.body)
    expect(item.count).to eq(2)
  end
  it "can get one item by its id" do
    merchant = create(:merchant)

    id = merchant.items.create(name: "boss 3000", description: "great gadget", unit_price: 20.00).id
    get "/api/v1/items/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end
end
