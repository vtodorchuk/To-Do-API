class Project < ApplicationRecord
  MAX_TEXT_LENGTH = 80

  belongs_to :user

  validates :name, presence: true, length: { maximum: MAX_TEXT_LENGTH }
end
