require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee_invalid) { FactoryBot.build(:employee, full_name: '') }
  let(:employee_valid) { FactoryBot.create(:employee) }
  let(:random_number) { rand(2...10) }
  let(:schedules) { create_list(:schedule, random_number, employee_id: employee_valid.id) }
  let(:work_days) { create_list(:work_day, random_number, employee_id: employee_valid.id, schedule_id: schedules.first.id) }

  context 'validations' do
    it 'is not valid without a full_name' do
      expect(employee_invalid).to_not be_valid
    end
  end

  context 'associations' do
    it 'has_many schedules' do
      schedules_e_id = schedules.map { |e| e[:employee_id] }.uniq.first
      expect(schedules.count).to eq(random_number)
      expect(schedules_e_id).to eq(employee_valid.id)
    end

    it 'has_many workdays' do
      expect(work_days.count).to eq(random_number)
    end
  end
end
