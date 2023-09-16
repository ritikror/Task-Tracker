class Task < ApplicationRecord
  belongs_to :user
  has_one :timer, dependent: :destroy
  accepts_nested_attributes_for :timer
  paginates_per 5

  validates :title, :assign_to,  presence: true
  validates :status ,presence:true, inclusion: { in: %w(Pending Complete) } 
  validate :administrator_only_create_task

  def administrator_only_create_task
    unless user.type == "Administrator"
      errors.add(:base, "Only Administrator have permission to create tasks.")  
    end
  end
end
  