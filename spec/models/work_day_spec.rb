require 'rails_helper'

RSpec.describe WorkDay, type: :model do
  let(:employee) { FactoryBot.create(:employee) }
  let(:schedule) { FactoryBot.create(:schedule, employee_id: employee.id) }
  let(:work_day) { FactoryBot.create(:work_day, employee_id: employee.id, schedule_id: schedule.id) }

  context 'validations' do
    subject { work_day }
    it { should validate_presence_of(:work_date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:break_start) }
    it { should validate_presence_of(:break_end) }
    it { should define_enum_for(:day_type) }
  end

  context 'associations' do
    it { should belong_to(:employee) }
    it { should belong_to(:schedule) }
  end
end
