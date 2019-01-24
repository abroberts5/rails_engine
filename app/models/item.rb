class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
end
