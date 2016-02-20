class Task < ActiveRecord::Base
  belongs_to :user
  enum priority: [:high, :medium, :low]

  validates :title,
            :presence => {message: "Task can't be blank." },
            :length => { in: 4..60, message: 'Task must be more than 4 and less than 60 characters.' }

  def priority= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end

  def completed?
    !completed_at.blank?
  end
end
