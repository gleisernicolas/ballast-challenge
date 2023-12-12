FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
    isbn { Faker::Number.number(digits: 10) }
    copies_amount { Faker::Number.number(digits: 2) }

    trait :with_loans do
      after(:create) do |book|
        create_list(:loan, 2, book: book, member: create(:member))
      end
    end

    trait :with_overdue_loans do
      after(:create) do |book|
        loan = Loan.new(book: book, member: create(:member), due_at: Date.today - 1.day, checked_out_at: Date.today - 3.days)
        loan.save(validate: false)
      end
    end
  end
end