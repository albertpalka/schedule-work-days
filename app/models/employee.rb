class Employee < ApplicationRecord
  has_many :schedules, dependent: :destroy
  # has_many :work_days, through: schedules

  validates :full_name, presence: true
end
