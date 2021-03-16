class Movement < ApplicationRecord
  belongs_to :account

  with_options presence: true do
    validates :account
    validates :amount, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2147483647, message: 'Out of setting range' }
    validates :date
  end
end
