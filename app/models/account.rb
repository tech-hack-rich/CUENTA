class Account < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :name
  end
end