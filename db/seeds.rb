#
# 10.times do
#   Customer.create!(
#     first_name: Faker::DragonBall.character,
#     last_name: Faker::BreakingBad.character
#   )
# end
#
# 10.times do
#   Merchant.create!(
#     name: Faker::HeyArnold.character
#   )
# end
#
# 10.times do
#   Item.create!(
#     name: Faker::Commerce.product_name,
#     description: Faker::HeyArnold.quote,
#     merchant_id: rand(1..10),
#     unit_price: rand(1..100)
#   )
# end
#
# 10.times do
#   Invoice.create!(
#     status: "shipped",
#     merchant_id: rand(1..10),
#     customer_id: rand(1..10)
#   )
# end
#
# 100.times do
#   InvoiceItem.create!(
#     quantity: rand(1..10),
#     unit_price: rand(1..20),
#     item_id: rand(1..10),
#     invoice_id: rand(1..10)
#   )
# end
#
# 10.times do
#   Transaction.create!(
#     credit_card_number: rand(1..1000),
#     credit_card_expiration_date: rand(1..1000),
#     result: "success",
#     invoice_id: rand(1..10)
#   )
# end
