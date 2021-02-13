class WorkDaysController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]

  def index
    @work_days = set_schedule.work_days
  end

  def new; end

  def edit
    @work_day = set_schedule.work_days.find(params[:id])
  end

  def show
    @work_days = set_schedule.work_days
  end

  private

  def set_schedule
    @employee = Employee.find(params[:employee_id])
    @schedule = @employee.schedules.find(params[:schedule_id])
  end
end
