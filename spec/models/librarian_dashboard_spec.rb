require 'rails_helper'

RSpec.describe LibrarianDashboard, type: :model do
  describe '#members_with_overdue_books' do
    it 'returns a list of members with overdue loans' do
      overdue_loan_book = create(:book, :with_overdue_loans)
      create(:loan, due_at: 1.day.from_now)

      members_with_overdue_books = LibrarianDashboard.new.members_with_overdue_books

      expect(members_with_overdue_books).to eq(overdue_loan_book.members)
    end
  end

  describe '#books_due_today' do
    it 'returns a list of books due today' do
      create(:book, :with_loans)
      loan = create(:loan, due_at: Date.today)

      books_due_today = LibrarianDashboard.new.books_due_today

      expect(books_due_today).to eq([loan.book])
    end
  end

  describe '#total_borrowed_books' do
    it 'returns the total number of borrowed books' do
      create_list(:book, 2, :with_loans)
      create_list(:book, 2)

      total_borrowed_books = LibrarianDashboard.new.total_borrowed_books

      expect(total_borrowed_books).to eq(2)
    end
  end

  describe '#total_books' do
    it 'returns the total number of books' do
      create_list(:book, 5)

      total_books = LibrarianDashboard.new.total_books

      expect(total_books).to eq(5)
    end
  end
end