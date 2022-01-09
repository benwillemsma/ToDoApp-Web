class ScheduledTask < ApplicationRecord
  belongs_to :task, optional: true

  validates :task, presence: true
  validates :started, presence: true
  validates :due, presence: true

  scope :started_before, ->(datetime) {where("started < ?", datetime)}
  scope :started_after, ->(datetime) {where("started > ?", datetime)}

  scope :due_before, ->(datetime) {where("due < ?", datetime)}
  scope :due_after, ->(datetime) {where("due > ?", datetime)}

  scope :finished_before, ->(datetime) {where("finished < ?", datetime)}
  scope :finished_after, ->(datetime) {where("finished > ?", datetime)}

  scope :active, ->(datetime) { self.started_before(datetime).due_after(datetime)}

  # Check if a given task overlaps this task    
  def overlaps?(other)
    started < other.due && other.started < due
  end

  # Return a scope for all task overlapping the given task, excluding the given task itself
  scope :overlapping, ->(scheduledtask) {
    where("id <> ? AND started < ? AND ? < due", scheduledtask.id, scheduledtask.due, scheduledtask.started)
  }
end