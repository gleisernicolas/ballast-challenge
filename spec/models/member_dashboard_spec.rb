require 'rails_helper'

RSpec.describe MemberDashboard, type: :model do
  describe '#borrowed_books' do
    it 'returns a list of borrowed books' do
      member = create(:member)
      borrowed_book = create(:book)
      create(:loan, member: member, book: borrowed_book)
      create(:book)

      borrowed_books = MemberDashboard.new(member).borrowed_books

      expect(borrowed_books).to eq([borrowed_book])
    end
  end

  describe '#overdue_books' do
    it 'returns a list of overdue books' do
      overdue_book = create(:book, :with_overdue_loans)
      create(:book)

      overdue_books = MemberDashboard.new(overdue_book.members.first).overdue_books

      expect(overdue_books).to eq([overdue_book])
    end
  end
end