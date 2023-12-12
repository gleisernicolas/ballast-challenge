FactoryBot.define do
  factory :loan do
    member
    book
    due_at { Faker::Date.forward(days: 14) }
    returned_at { nil }
    checked_out_at { Faker::Date.backward(days: 1) }
  end
end