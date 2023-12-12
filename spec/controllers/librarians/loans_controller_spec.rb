require 'rails_helper'

RSpec.describe Librarians::LoansController, type: :controller do
  let(:librarian) { create(:librarian) }
  before do
    sign_in librarian
  end

  describe 'GET #index' do
    it 'returns a list of loans' do
      expected_loans = create_list(:loan, 3)

      get :index, format: :json
      returned_loans = JSON.parse(response.body)
      returned_loans_ids = returned_loans.map{|h| h['id']}
      
      expect(response).to have_http_status(:success)
      expect(returned_loans_ids).to eq(expected_loans.map(&:id))
    end
  end

  describe 'GET #show' do
    it 'returns a loan' do
      loan = create(:loan)

      get :show, params: { id: loan.id }, format: :json

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(loan.id)
    end
  end

  describe 'PUT #return' do
    it 'return a loaned book' do
      loan = create(:loan, returned_at: nil)

      expect { put :return, params: { id: loan.id, loan: { returned_at: Date.today } }, format: :json }.to change { loan.reload.returned_at }.from(nil).to(Date.today)
    end
  end
end