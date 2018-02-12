module V1
  class MessageSerializer < ActiveModel::Serializer
    attributes :id, :text, :created_at
    has_one :user
    has_one :target
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :created_at
  end
end
