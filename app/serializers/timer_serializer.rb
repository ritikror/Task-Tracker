class TimerSerializer < ActiveModel::Serializer
  attributes :id, :time_in_minute, :task
  def task
    object.task.title
  end
end
