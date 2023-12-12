require 'rails_helper'

RSpec.describe Librarians::DashboardController, type: :controller do
  let(:librarian) { create(:librarian) }
  before do
    sign_in librarian
  end

  describe 'GET #show' do
    it 'returns a dashboard' do
      # I prefer to test the actual return in the model spec
      expect(LibrarianDashboard).to receive(:new).and_call_original

      get :show, format: :json
    end
  end
end