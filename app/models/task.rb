class Task < ApplicationRecord
  belongs_to :user

  validates :title, :assign_to, :time, presence: true
  validates :status ,presence:true, inclusion: { in: %w(working complete) } 
  validate :administrator_only_create_task

  def administrator_only_create_task
    unless user.type == "Administrator"
      errors.add(:base, "Only Administrator have permission to create tasks.")  
    end
  end
end
