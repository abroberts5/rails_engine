require 'rails_helper'

# describe "Items API" do
#   it "has a list of items from merchant" do
#     merchant = create(:merchant)
#     item_1 = merchant.items.create(name: "boss 3000", description: "great gadget", unit_price: 20.00)
#     item_2 = merchant.items.create(name: "silly puddy", description: "desolves internally", unit_price: 10.00)
#
#     get "/api/vi/#{merchant.id}/items"
#
#     expect(response).to be_successful
# 
#     item = JSON.parse(response.body)
#     expect(item.count).to eq(2)
#   end
# end
