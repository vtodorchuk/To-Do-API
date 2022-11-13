class Comment < ApplicationRecord
  MAX_BODY_LENGTH = 500

  belongs_to :task

  validates :body, presence: true, length: { maximum: MAX_BODY_LENGTH }
end
