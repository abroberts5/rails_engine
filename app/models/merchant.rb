class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def self.most_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group("merchants.id")
    .limit(quantity)
  end

  def self.most_items(quantity)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .order("sum(invoice_items.quantity) DESC")
    .group("merchants.id")
    .limit(quantity)
  end

  def self.total_revenue(date)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .where("transactions.updated_at=?", date)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def all_revenue
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*")
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
