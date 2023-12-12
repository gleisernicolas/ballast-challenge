class Book < ActiveRecord::Base
  scope :overdue, -> { borrowed.where('loans.due_at < ?', Date.today).distinct }
  scope :borrowed, -> { joins(:loans).where('loans.returned_at IS NULL').distinct }
  scope :borrowed_due_today, -> { borrowed.where('loans.due_at = ?', Date.today).distinct }
  scope :available, -> {
    left_joins(:loans)
      .group('books.id')
      .having('COUNT(loans.id) < books.copies_amount OR COUNT(loans.id) IS NULL')
  }
  scope :available_for_member, ->(member) { available.left_joins(:loans).where('loans.user_id != ? OR loans.id IS NULL', member.id) }

  validates :title, :author, :genre, :isbn, :copies_amount, presence: true
  validates :isbn, uniqueness: true
  validates :copies_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  has_many :loans, dependent: :destroy
  has_many :members, through: :loans

  before_destroy :check_for_loans

  def available_copies
    @available_copies ||= copies_amount - copies_borrowed
  end

  # Usually this would be `available?`, but I'm using `available` because `available?` looks strange in the api response
  def available
    @available ||= available_copies.positive?
  end

  def copies_borrowed
    @copies_borrowed ||= active_loans.count
  end

  def borrowed_due_dates
    @borrowed_due_dates ||= active_loans.map(&:due_at)
  end

  def active_loans
    @active_loans ||= loans.where(returned_at: nil).order(:due_at)
  end

  private

  # I prefer not to use callbacks, but I think this is the best way to handle this because this would also prevent deletion of books that have copies checked out via the console
  def check_for_loans
    return unless loans.where(returned_at: nil).any?

    errors.add(:base, 'Cannot delete book that has copies checked out')
  end
end