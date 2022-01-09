class ScheduleTasksJob < ApplicationJob
  queue_as :default

  def perform(task)
    puts "Scheduled from Job"
  end
end
