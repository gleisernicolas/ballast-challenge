class LoanCreationService
  def self.call(loan_params, current_member)
    book = Book.includes(members: :loans).find(loan_params[:book_id])

    raise UnavailableBookError, "Book #{book.id} are not available" unless book.available_copies.positive?
    raise MemberAlreadyHasBookError, "User #{loan_params[:user_id]} already has book #{book.id}" if book.members.include?(current_member)

    checked_out_at = loan_params[:checked_out_at] || Time.now
    Loan.new(loan_params.merge(checked_out_at: checked_out_at))
  end

  class UnavailableBookError < StandardError; nil end
  class MemberAlreadyHasBookError < StandardError; nil end
end