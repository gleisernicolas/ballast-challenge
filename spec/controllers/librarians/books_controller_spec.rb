require 'rails_helper'

RSpec.describe Librarians::BooksController, type: :controller do
  let(:librarian) { create(:librarian) }
  before do
    sign_in librarian
  end

  describe 'GET #index' do
    it 'returns a list of books' do
      expected_books = create_list(:book, 3, author: 'A real author')
      create_list(:book, 2)

      get :index, params: { author: 'A real author' }, format: :json
      returned_books = JSON.parse(response.body)
      returned_books_ids = returned_books.map{|h| h['id']}

      expect(response).to have_http_status(:success)
      expect(returned_books_ids).to eq(expected_books.map(&:id))
    end
  end

  describe 'GET #show' do
    it 'returns a book' do
      book = create(:book)

      get :show, params: { id: book.id }, format: :json

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(book.id)
    end
  end

  describe 'POST #create' do
    it 'creates a book' do
      book_params = attributes_for(:book)

      post :create, params: { book: book_params }, format: :json

      expect(response).to have_http_status(:success)
      expect(Book.last.title).to eq(book_params[:title])
    end
  end

  describe 'PUT #update' do
    it 'updates a book' do
      book = create(:book)
      book_params = attributes_for(:book)

      put :update, params: { id: book.id, book: book_params }, format: :json

      expect(response).to have_http_status(:success)
      expect(Book.last.title).to eq(book_params[:title])
    end
  end
end