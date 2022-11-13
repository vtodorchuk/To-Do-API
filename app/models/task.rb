class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 80

  belongs_to :project

  has_many :comments, dependent: :destroy

  has_many_attached :files

  validates :deadline, presence: false, if: :deadline_is_possible?

  validates :title, presence: false, length: { maximum: MAX_TITLE_LENGTH }

  def deadline_is_possible?
    return unless deadline < DateTime.now

    errors.add(:deadline, 'must be possible')
  end
end
