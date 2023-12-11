class Librarians::BooksController < ApplicationController
  before_action :authenticate_librarian!
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    books = Book.all
    render json: books, status: 200
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: 201
    else
      render json: { errors: book.errors }, status: 422
    end
  end

  def show
    render json: @book, status: 200
  end

  def update
    if @book.update(book_params)
      render json: @book, status: 200
    else
      render json: { errors: @book.errors }, status: 422
    end
  end

  def destroy
    # Add validation to prevent deletion of books that have copies checked out
    @book.destroy
    render status: 204
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :isbn, :copies_amount)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end