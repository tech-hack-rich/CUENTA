class Account < ApplicationRecord
  belongs_to :user
  has_many :assets, dependent: :destroy
  has_many :movements, dependent: :destroy

  with_options presence: true do
    validates :user
    validates :name
  end
end