class Account < ApplicationRecord
  belongs_to :user

  with_option presence: true do
    validates :user
    validates :name
  end
  validates :info
end