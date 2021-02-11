class Schedule < ApplicationRecord
  belongs_to :employee

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :schedule_from, presence: true
  validates :schedule_to, presence: true
  validates :default_start_time, presence: true
  validates :default_end_time, presence: true
  validates :default_break_start, presence: true
  validates :default_break_end, presence: true
end
