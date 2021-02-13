class CreateWorkDay
  def initialize(schedule_data)
    @schedule_data = schedule_data
  end

  def call
    valid_dates.map do |date|
      create_work_day(date)
    end
  end

  private

  def valid_dates
    (@schedule_data.schedule_from..@schedule_data.schedule_to).to_a.reject(&:on_weekend?)
  end

  def set_start_time
    @schedule_data.default_start_time
  end

  def set_end_time
    @schedule_data.default_end_time
  end

  def set_break_start
    @schedule_data.default_break_start
  end

  def set_break_end
    @schedule_data.default_break_end
  end

  def create_work_day(date)
    @schedule_data.work_days.create!(
      employee_id: @schedule_data.employee_id,
      work_date: date,
      start_time: set_start_time,
      end_time: set_end_time,
      break_start: set_break_start,
      break_end: set_break_end
    )
  end
end
