FactoryBot.define do
  factory :beer_log do
    beer_id   1
    quantity  10
    date        Time.now
    created_at  Time.now
    updated_at  Time.now
  end
end
