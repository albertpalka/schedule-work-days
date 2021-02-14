FactoryBot.define do
  factory :schedule do
    association :employee
    sequence(:title) { |n| Faker::Lorem.word + n.to_s }
    schedule_from { Date.today.strftime('%Y-%m-%d') }
    schedule_to { (Date.today + 5).strftime('%Y-%m-%d') }
    default_start_time { '2000-01-01 09:00:00' }
    default_end_time { '2000-01-01 17:00:00' }
    default_break_start { '2000-01-01 12:00:00' }
    default_break_end { '2000-01-01 13:00:00' }
  end
end
