module V1
  class MessageSerializer < ActiveModel::Serializer
    attributes :id, :text
    has_one :user
    has_one :target
  end
end
