class CreateScheduledTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_tasks do |t|
      t.belongs_to :task, foreign_key: {on_delete: :cascade}
      t.datetime :started
      t.datetime :finished
      t.datetime :due
      t.interval :interval

      t.timestamps
    end
  end
end
