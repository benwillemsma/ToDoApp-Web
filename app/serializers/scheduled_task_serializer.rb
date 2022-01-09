class ScheduledTaskSerializer < ActiveModel::Serializer
  attributes :id, :started, :finished, :due, :interval
  has_one :task
end
