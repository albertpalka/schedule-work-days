class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :title
      t.date :schedule_from
      t.date :schedule_to
      t.time :default_start_time
      t.time :default_end_time
      t.time :default_break_start
      t.time :default_break_end
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
