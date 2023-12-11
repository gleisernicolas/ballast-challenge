class Members::BooksController < ApplicationController
  before_action :authenticate_member!

  def available_books
    books = Book.available_books
    render json: books, status: 200
  end
end