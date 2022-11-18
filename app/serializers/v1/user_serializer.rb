class V1::UserSerializer
  include JSONAPI::Serializer

  attribute :id, :username
end
