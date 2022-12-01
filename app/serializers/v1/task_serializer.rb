class V1::TaskSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :deadline, :completed

  belongs_to :project
  has_many :comments
end
