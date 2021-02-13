class CreateWorkDays < ActiveRecord::Migration[6.0]
  def change
    create_table :work_days do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.date :work_date
      t.time :start_time
      t.time :end_time
      t.time :break_start
      t.time :break_end
      t.integer :day_type, default: 0

      t.timestamps
    end
  end
end
