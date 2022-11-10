class Project < ApplicationRecord
  MAX_TEXT_SIZE = 80

  belongs_to :user

  validates :name, presence: true, length: { maximum: MAX_TEXT_SIZE }
end
