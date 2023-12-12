class Members::BooksController < ApplicationController
  before_action :authenticate_member!

  def available_books
    books = Book.available_for_member(current_member)

    render json: books, status: 200, each_serializer: MemberBookSerializer
  end

  # Make this case insensitive
  def index
    books = Book.includes(:loans).where(filter_params)

    render json: books, status: 200, each_serializer: MemberBookSerializer
  end

  def show
    book = Book.find(params[:id])

    render json: book, status: 200, serializer: MemberBookSerializer
  end

  private

  def filter_params
    params.permit(:title, :author, :genre, :isbn)
  end
end