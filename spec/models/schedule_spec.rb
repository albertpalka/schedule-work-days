require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:employee) { FactoryBot.create(:employee) }
  let(:employees) { create_list(:employee, 5) }
  let(:schedule) { FactoryBot.create(:schedule, employee_id: employee.id) }

  context 'validations' do
    subject { schedule }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:schedule_from) }
    it { should validate_presence_of(:schedule_to) }
    it { should validate_presence_of(:default_start_time) }
    it { should validate_presence_of(:default_end_time) }
    it { should validate_presence_of(:default_break_start) }
    it { should validate_presence_of(:default_break_end) }
  end

  context 'associations' do
    it { should belong_to(:employee) }
    it { should have_many(:work_days) }
  end
end
