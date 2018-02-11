class RequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :timelimit, :reward, :comment
  has_one :user
end
