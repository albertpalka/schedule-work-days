class WorkDay < ApplicationRecord
  belongs_to :employee
  belongs_to :schedule

  enum day_type: { work_day: 0, sick_leave: 1, day_off: 2, bank_holiday: 3 }

  validates :work_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :break_start, presence: true
  validates :break_end, presence: true
end
