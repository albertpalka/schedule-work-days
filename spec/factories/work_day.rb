FactoryBot.define do
  # TODO: add relations
  factory :work_day do
    employee_id { 1 }
    schedule_id { 1 }
    work_date { '2021-02-13' }
    start_time { '2000-01-01 09:00:00' }
    end_time { '2000-01-01 17:00:00' }
    break_start { '2000-01-01 12:00:00' }
    break_end { '2000-01-01 13:00:00' }
    day_type { 0 }
  end
end
