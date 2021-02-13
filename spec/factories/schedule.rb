FactoryBot.define do
  # TODO: add relations
  factory :schedule do
    employee_id { 1 }
    sequence(:title) { |n| Faker::Lorem.word + n.to_s }
    schedule_from { '2021-02-13' }
    schedule_to { '2021-02-20' }
    default_start_time { '2000-01-01 09:00:00' }
    default_end_time { '2000-01-01 17:00:00' }
    default_break_start { '2000-01-01 12:00:00' }
    default_break_end { '2000-01-01 13:00:00' }
  end
end
