class Task < ApplicationRecord
  belongs_to :project

  has_many :comments
  has_many_attached :files

  validates :deadline_is_possible?

  def deadline_is_possible?
    current = Date.current

    return unless deadline < current

    errors.add(:deadline, 'must be possible')
  end
end
