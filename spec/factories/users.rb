FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'1Abcdf'}
    password_confirmation {password}
  end
end