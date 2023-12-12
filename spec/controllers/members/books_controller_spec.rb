require 'rails_helper'

RSpec.describe Members::BooksController, type: :controller do
  let(:member) { create(:member) }
  before do
    sign_in member
  end
  
  describe 'GET #available_books' do
    it 'returns a list of available books' do
      available_book = create(:book)
      create(:loan, member: member)

      get :available_books, format: :json

      returned_books = JSON.parse(response.body)
      returned_books_ids = returned_books.map{|h| h['id']}

      expect(response).to have_http_status(:success)
      expect(returned_books_ids).to eq([available_book.id])
    end
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
end