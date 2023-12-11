class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user, :book, :due_at, :checked_out_at, presence: true
  validate :due_at_cannot_be_in_the_past

  def due_at_cannot_be_in_the_past
    if due_at.present? && due_at < Date.today
      errors.add(:due_at, "can't be in the past")
    end
  end
end