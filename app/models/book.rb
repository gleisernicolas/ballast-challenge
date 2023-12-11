class Book < ActiveRecord::Base
  validates :title, :author, :genre, :isbn, :copies_amount, presence: true
  validates :isbn, uniqueness: true
  validates :copies_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  has_many :loans, dependent: :destroy
  has_many :users, through: :loans

  def available_copies
    copies_amount - loans.where(returned_at: nil).count
  end

  def self.available_books
    Book.all.select { |book| book.available_copies > 0 }
  end
end