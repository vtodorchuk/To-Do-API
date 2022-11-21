class V1::CommentSerializer
  include JSONAPI::Serializer

  attributes :id, :body

  belongs_to :task
  # has_one_attached :file
end
