require 'csv'

namespace :seed do
  task customers: :environment do
    customers = './lib/data/customers.csv'
    CSV.foreach(customers, headers: true) do |row|
      Customer.create(row.to_h)
    end
  end
  task invoices: :environment do
    invoices = './lib/data/invoices.csv'
    CSV.foreach(invoices, headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end
end
