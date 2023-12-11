class Book < ActiveRecord::Base
  validates :title, :author, :genre, :isbn, :copies_amount, presence: true
  validates :isbn, uniqueness: true
  validates :copies_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  has_many :loans, dependent: :destroy
  has_many :members, through: :loans

  before_destroy :check_for_loans

  def available_copies
    copies_amount - loans.where(returned_at: nil).count
  end

  def self.available_books
    Book.all.select { |book| book.available_copies > 0 }
  end

  private

  # I prefer not to use callbacks, but I think this is the best way to handle this because this would also prevent deletion of books that have copies checked out via the console
  def check_for_loans
    return unless loans.where(returned_at: nil).any?

    errors.add(:base, 'Cannot delete book that has copies checked out')
  end
end