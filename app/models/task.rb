class Task < ApplicationRecord
  belongs_to :project

  validate :deadline_is_possible?

  def deadline_is_possible?
    errors.add(:deadline, 'must be possible') if deadline < Date.current
  end
end
