FactoryBot.define do
  factory :transaction do
    credit_card_number { 1234567891234567 }
    credit_card_expiration_date { 10112021 }
  end
end
