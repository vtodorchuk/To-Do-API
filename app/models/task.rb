class Task < ApplicationRecord
  belongs_to :project

  has_many :comments, dependent: :destroy

  has_many_attached :files

  validates :deadline_is_possible?

  def deadline_is_possible?
    return unless deadline < DateTime.now

    errors.add(:deadline, 'must be possible')
  end
end
