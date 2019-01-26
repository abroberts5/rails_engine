class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number, :credit_card_expiration_date, :result
  belongs_to :invoice

  def self.successful
    where(result: 'success')
  end
end
