FactoryBot.define do
  factory :movement do
    association :account
    amount   {'1000'}
    date     {'2020-01-01'}
  end
end
