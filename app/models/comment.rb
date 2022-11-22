class Comment < ApplicationRecord
  MAX_BODY_LENGTH = 500

  belongs_to :task
  has_one_attached :image

  validates :body, presence: true, length: { maximum: MAX_BODY_LENGTH }

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image) if image.attached?
  end
end
