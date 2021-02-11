class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]

  def index; end

  def create
    @employee = Employee.find(params[:employee_id])
    @schedule = @employee.schedules.create(schedule_params)
    redirect_to employee_path(@employee)
  end

  def show; end

  def edit
    @schedule = set_schedule
  end

  def update
    @schedule = set_schedule

    if @schedule.update(schedule_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  private

  def set_schedule
    @employee = Employee.find(params[:employee_id])
    @schedule = @employee.schedules.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :schedule_from, :schedule_to,
                                     :default_start_time, :default_end_time,
                                     :default_break_start, :default_break_end,
                                     :active)
  end
end
