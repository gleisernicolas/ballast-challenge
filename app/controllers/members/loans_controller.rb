class Members::LoansController < ApplicationController
  before_action :authenticate_member!

  def index
    loans = Loan.where(user_id: current_member.id)
    render json: loans, status: 200
  end

  def create
    loan = Loan.new(loan_params)
    if loan.save
      render json: loan, status: 201
    else
      render json: { errors: loan.errors }, status: 422
    end
  end

  def show
    loan = Loan.find(params[:id])
    render json: loan, status: 200
  end

  private

  def loan_params
    params.require(:loan).permit(:book_id, :due_at, :checked_out_at, :returned_at).merge(user_id: current_member.id)
  end
end
