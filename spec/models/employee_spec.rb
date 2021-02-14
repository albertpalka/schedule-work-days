require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { FactoryBot.build(:employee, full_name: '') }

  context 'validations' do
    it 'is not valid without a full_name' do
      expect(employee).to_not be_valid
    end
  end

  context 'associations' do
    it { should have_many(:work_days) }
    it { should have_many(:schedules) }
  end
end
