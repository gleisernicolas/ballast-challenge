class LibrarianDashboard

  attr_reader :total_books, :total_borrowed_books, :books_due_today, :members_with_overdue_books

  def initialize
    @total_books = books.count
    @total_borrowed_books = books.borrowed.count
    @books_due_today = books.borrowed_due_today
    @members_with_overdue_books = books.overdue.map(&:members).flatten.uniq
  end

  private

  def books
    @books ||= Book.all
  end
end