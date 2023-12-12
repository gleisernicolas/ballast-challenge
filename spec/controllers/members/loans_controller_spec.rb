require 'rails_helper'

RSpec.describe Members::LoansController, type: :controller do
  let(:member) { create(:member) }
  before do
    sign_in member
  end

  describe 'GET #index' do
    it 'returns a list of loans' do
      expected_loans = create_list(:loan, 3, member: member)

      get :index, format: :json
      returned_loans = JSON.parse(response.body)
      returned_loans_ids = returned_loans.map{|h| h['id']}
      
      expect(response).to have_http_status(:success)
      expect(returned_loans_ids).to eq(expected_loans.map(&:id))
    end
  end

  describe 'GET #show' do
    it 'returns a loan' do
      loan = create(:loan, member: member)

      get :show, params: { id: loan.id }, format: :json

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(loan.id)
    end
  end

  describe 'POST #create' do
    it 'creates a loan' do
      loan_params = attributes_for(:loan)
      loan_params[:book_id] = create(:book).id
      expect { post :create, params: { loan: loan_params }, format: :json }.to change(Loan, :count).by(1)
    end
  end
end