FactoryBot.define do
  factory :user do
    email                  "user@test.com"
    password               "password"
    password_confirmation  "password"
    confirmed_at           Time.now
  end
end