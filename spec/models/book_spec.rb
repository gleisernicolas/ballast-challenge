require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'associations' do
    it { should belong_to(:member).class_name('User').with_foreign_key('user_id') }
    it { should belong_to(:book) }
  end

  describe 'validations' do
    it { should validate_presence_of(:member) }
    it { should validate_presence_of(:book) }
    it { should validate_presence_of(:due_at) }
    it { should validate_presence_of(:checked_out_at) }

    describe '#due_at_cannot_be_in_the_past' do
      context 'when due_at is in the past' do
        it 'adds an error to due_at' do
          loan = build(:loan, due_at: 1.day.ago)

          loan.valid?

          expect(loan.errors[:due_at]).to include("can't be in the past")
        end
      end

      context 'when due_at is in the future' do
        it 'does not add an error to due_at' do
          loan = build(:loan, due_at: 1.day.from_now)

          loan.valid?

          expect(loan.errors[:due_at]).to be_empty
        end
      end
    end
  end
end