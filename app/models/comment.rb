class Comment < ApplicationRecord
  MAX_BODY_LENGTH = 256
  MAX_BYTE_SIZE = 10.megabytes
  ACCEPTED_TYPES = %w[image/jpeg image/png].freeze

  belongs_to :task
  has_one_attached :image

  validates :body, presence: true, length: { maximum: MAX_BODY_LENGTH }

  validates :image, presence: false, if: :acceptable_image

  def acceptable_image
    return unless image.attached?

    errors.add(:image, 'Image size to big') unless image.byte_size < MAX_BYTE_SIZE

    return if ACCEPTED_TYPES.include?(image.content_type)

    errors.add(:image, "This #{image.content_type} type is not supported")
  end

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(image) if image.attached?
  end
end
