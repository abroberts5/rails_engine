require 'csv'

namespace :seed do
  task customers: :environment do
    customers = './lib/data/customers.csv'
    CSV.foreach(customers, headers: true, header_converters: :symbol) do |row|
      Customer.create!(row.to_h)
    end
  end
  task merchants: :environment do
    merchants = './lib/data/merchants.csv'
    CSV.foreach(merchants, headers: true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_h)
    end
  end
  task items: :environment do
    items = './lib/data/items.csv'
    CSV.foreach(items, headers: true, header_converters: :symbol) do |row|
      Item.create!(row.to_h)
    end
  end
  task invoices: :environment do
    invoices = './lib/data/invoices.csv'
    CSV.foreach(invoices, headers: true, header_converters: :symbol) do |row|
      Invoice.create!(row.to_h)
    end
  end
  task invoice_items: :environment do
    invoice_items = './lib/data/invoice_items.csv'
    CSV.foreach(invoice_items, headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create!(row.to_h)
    end
  end
  task transactions: :environment do
    transactions = './lib/data/transactions.csv'
    CSV.foreach(transactions, headers: true, header_converters: :symbol) do |row|
      t = Time.now + 1.year
      Transaction.create!(id: row[:id],
                        invoice_id: row[:invoice_id],
                        credit_card_number: row[:credit_card_number],
                        credit_card_expiration_date: t.strftime('%m%d%Y'),
                        result: row[:result],
                        created_at: row[:created_at],
                        updated_at: row[:updated_at])
    end
  end
end
