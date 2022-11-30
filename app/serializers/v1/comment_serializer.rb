class V1::CommentSerializer
  include JSONAPI::Serializer

  attributes :id, :body
  attribute :image_url

  belongs_to :task
end
