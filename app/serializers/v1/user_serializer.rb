class V1::UserSerializer
  include JSONAPI::Serializer

  attributes :id, :username
end
