module V1
  class RequestSerializer < ActiveModel::Serializer
    attributes :id, :title, :timelimit, :reward, :comment
    has_one :user
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :created_at
  end
end
