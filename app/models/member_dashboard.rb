class MemberDashboard
  attr_reader :borrowed_books, :overdue_books

  def initialize(member)
    @borrowed_books = member.books
    @overdue_books = member.books.overdue
  end
end