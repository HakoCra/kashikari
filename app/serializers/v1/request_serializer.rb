module V1
  class RequestSerializer < ActiveModel::Serializer
    attributes :id, :title, :timelimit, :reward, :comment
    has_one :user
    has_many :accepted_users, class_name: "User"
  end

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :created_at, :latest_message

    def latest_message
      Message.where(user: object, target: current_user).
        or(Message.where(user: current_user, user: object)).
        last
    end
  end
end
