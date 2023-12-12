require 'rails_helper'

RSpec.describe Members::DashboardController, type: :controller do
  let(:member) { create(:member) }
  before do
    sign_in member
  end

  describe 'GET #show' do
    it 'returns a dashboard' do
      expect(MemberDashboard).to receive(:new).and_call_original
      
      get :show, format: :json
    end
  end
end