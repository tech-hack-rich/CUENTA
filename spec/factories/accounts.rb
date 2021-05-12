FactoryBot.define do
  factory :account do
    association :user
    name      {'test'}
    info      {'テストです'}
  end
end
