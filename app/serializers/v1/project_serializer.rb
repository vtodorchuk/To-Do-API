class V1::ProjectSerializer
  include JSONAPI::Serializer

  attributes :id, :name

  belongs_to :user
end
