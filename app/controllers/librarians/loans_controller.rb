class Librarians::LoansController < ApplicationController
  before_action :authenticate_librarian!
  before_action :set_loan, only: [:show, :return]

  def index
    loans = Loan.all
    render json: loans, status: 200
  end

  def show
    render json: @loan, status: 200
  end

  def return
    if @loan.update(return_params)
      render json: @loan, status: 200
    else
      render json: { errors: @loan.errors }, status: 422
    end
  end

  private

  def return_params
    params.require(:loan).permit(:returned_at)
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end
end