class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :urgency, :success, :failure, :webLink
  has_many :children
  belongs_to :parent
  has_many :scheduledTasks
end
