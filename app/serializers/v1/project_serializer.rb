class V1::ProjectSerializer
  include JSONAPI::Serializer

  attribute :id, :name

  belongs_to :user
end
