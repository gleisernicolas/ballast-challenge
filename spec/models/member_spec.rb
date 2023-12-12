require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'associations' do
    it { should have_many(:loans).dependent(:restrict_with_error) }
    it { should have_many(:books).through(:loans) }
  end
end