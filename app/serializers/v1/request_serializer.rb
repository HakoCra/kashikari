module V1
  class RequestSerializer < ActiveModel::Serializer
    attributes :id, :title, :timelimit, :reward, :comment
    has_one :user
    has_many :accepted_users, class_name: "User"
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :created_at
  end
end
